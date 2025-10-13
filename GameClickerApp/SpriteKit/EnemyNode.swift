//
//  EnemyNode.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    var model: EnemyModel?
    var hp = 100
    var isAnimating = false
    
    init(model: EnemyModel) {
        self.model = model
        let texture = SKTexture(imageNamed: "\(model.name)I_1")
        super.init(texture: texture, color: .clear, size: CGSize(width: 350, height: 350))
        self.xScale = -1
        name = "enemy"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func idleEnemyAnimation(){
        let texture = AnimationHelper.loadTextures(prefix: "\(model!.name)I_", count: 1...4)
        let animation = SKAction.repeat(AnimationHelper.animate(textures: texture, speed: 0.13, repeatForever: false), count: 3)
//        let sequence = SKAction.sequence([animation, SKAction.wait(forDuration: 3.2)])
        run(SKAction.repeatForever(animation), withKey: "idle")
    }
    
    func takeHit() {
        guard let model = model else{return}
        
            if model.hp <= 10{
                die()
                return
            }else{
                let texture = AnimationHelper.loadTextures(prefix: "\(model.name)TH_", count: 1...4)
                
                
                guard !isAnimating else { return }
                isAnimating = true
                model.takeHit(amount: 10)
                let finish = SKAction.run { [weak self] in
                    self?.isAnimating = false
                }
                let animation = AnimationHelper.animate(textures: texture, speed: 0.1, repeatForever: false)
                run(SKAction.sequence([SKAction.wait(forDuration: 0.24) ,animation, finish]), withKey: "attack")
            }
        
        print("Ворог отримав удар! HP: \(model.hp)")
    }
    private func die() {
        guard let model = model else{return}
        removeAction(forKey: "idle")
        model.hp = 0
        
        guard !isAnimating else { return }
        isAnimating = true
        model.takeHit(amount: 10)
        let finish = SKAction.run { [weak self] in
            self?.isAnimating = false
        }
        let deathTextures = AnimationHelper.loadTextures(prefix: "\(model.name)D_", count: 1...4)
        let deathAnimation = AnimationHelper.animate(textures: deathTextures, speed: 0.15, repeatForever: false)
        
        let setFinalFrame = SKAction.run { [weak self] in
            self?.texture = SKTexture(imageNamed: "\(model.name)D_4")
        }

        let sequence = SKAction.sequence([SKAction.wait(forDuration: 0.24), deathAnimation, setFinalFrame, finish])
        run(sequence, withKey: "death")
    }
    
}
