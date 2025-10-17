//
//  NPCNode.swift
//  GameClickerApp
//
//  Created by Vladuslav on 18.10.2025.
//

import SpriteKit

enum NPCType {
    case shop
    case quest
    case healer
}

class NPCNode: SKSpriteNode {
    let type: NPCType
    
    init(type: NPCType) {
        self.type = type
        
        var texture: SKTexture
        switch type {
        case .shop:
            texture = SKTexture(imageNamed: "MerchantI_1")
        case .quest:
            texture = SKTexture(imageNamed: "Advanture_1")
        case .healer:
            texture = SKTexture(imageNamed: "npc_healer")
        }
        
        super.init(texture: texture, color: .clear, size: texture.size())
        self.zPosition = 5
        self.setScale(2.5) // для збільшення, якщо потрібно
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
