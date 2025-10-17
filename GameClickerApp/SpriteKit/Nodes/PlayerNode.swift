//
//  EnemyNode.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import SpriteKit



class PlayerNode: SKSpriteNode {
    var index = 0
    var isAnimating = false

    init() {
        let texture = SKTexture(imageNamed: "knightI_1")
        super.init(texture: texture, color: .clear, size: CGSize(width: 450, height: 450))
        name = "player"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func idlePlayerAnimation(){
        let texture = AnimationHelper.loadTextures(prefix: "knightI_", count: 1...11)
        let animation = AnimationHelper.animate(textures: texture, speed: 0.07)
//        let sequence = SKAction.sequence([animation, SKAction.wait(forDuration: 3.2)])
        run(animation)
    }

    func makeHit() {
            // якщо герой зараз анімується — ігноруємо клік
            guard !isAnimating else { return }
            isAnimating = true
            
        let moveRange = [8...14, 8...14]
            let textures = AnimationHelper.loadTextures(prefix: "knightA_", count: moveRange[index])
            index = (index + 1) % 2
            
            let animation = AnimationHelper.animate(textures: textures, speed: 0.08, repeatForever: false)
            let finish = SKAction.run { [weak self] in
                self?.isAnimating = false
            }

            run(SKAction.sequence([animation, finish]), withKey: "attack")
        }
}


