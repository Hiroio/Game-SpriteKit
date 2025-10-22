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
            texture = SKTexture(imageNamed: "PriestI_1")
        }
        
        super.init(texture: texture, color: .clear, size: texture.size())
        self.zPosition = 5
        self.setScale(2) // для збільшення, якщо потрібно
        
        IdleAnimation()
    }
    func IdleAnimation(){
        var textures: [SKTexture] = []
        switch type {
        case .shop:
            textures = AnimationHelper.loadTextures(prefix: "MerchantI_", count: 1...4)
        case .quest:
            textures = AnimationHelper.loadTextures(prefix: "Advanture_", count: 1...6)
        case .healer:
            textures = AnimationHelper.loadTextures(prefix: "PriestI_", count: 1...4)
        }
        
        let animation = AnimationHelper.animate(textures: textures, speed: 0.22)
        self.run(animation, withKey: "idle")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
