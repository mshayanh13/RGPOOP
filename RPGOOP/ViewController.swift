//
//  ViewController.swift
//  RPGOOP
//
//  Created by Mohammad Hemani on 2/26/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHPLabel: UILabel!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var chestButton: UIButton!
    @IBOutlet weak var enemyImage: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPower: 20)
        
        playerHPLabel.text = "\(player.hp)"
        
        generateRandomEnemy()
        
        enemyHPLabel.text = "\(enemy.hp)"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        
        enemyImage.isHidden = false
    }

    @IBAction func chestButtonPressed(_ sender: UIButton) {
        
        chestButton.isHidden = true
        printLabel.text = chestMessage
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func attackButtonPressed(_ sender: UIButton) {
        
        if enemy.attemptAttack(attackPwr: player.attackPower) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
            
        } else {
            printLabel.text = "Attack was unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(item: loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.isHidden = false
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.isHidden = true
        }
        
    }

}

