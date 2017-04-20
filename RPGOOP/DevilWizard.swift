//
//  DevilWizard.swift
//  RPGOOP
//
//  Created by Mohammad Hemani on 2/26/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}
