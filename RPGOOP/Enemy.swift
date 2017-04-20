//
//  Enemy.swift
//  RPGOOP
//
//  Created by Mohammad Hemani on 2/26/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Dusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
}
