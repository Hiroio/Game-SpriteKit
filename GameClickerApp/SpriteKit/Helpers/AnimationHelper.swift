//
//  EnemyNode.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import SpriteKit


enum AnimationHelper {
    static func loadTextures(prefix: String, count: ClosedRange<Int>) -> [SKTexture] {
        (count).map { SKTexture(imageNamed: "\(prefix)\($0)") }
    }
    
    static func animate(textures: [SKTexture], speed: Double, repeatForever: Bool = true) -> SKAction {
        let animation = SKAction.animate(with: textures, timePerFrame: speed)
        return repeatForever ? SKAction.repeatForever(animation) : animation
    }
}
