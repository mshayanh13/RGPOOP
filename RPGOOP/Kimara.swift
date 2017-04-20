//
//  Kimara.swift
//  RPGOOP
//
//  Created by Mohammad Hemani on 2/26/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr: attackPwr)
        } else {
            return false
        }
    }
    
}
