//
//  CampScene.swift
//  GameClickerApp
//
//  Created by Vladuslav on 23.10.2025.
//

import SpriteKit


class CampScene: SKScene {
    var bgWidth = 0.0
    var player: PlayerNode!
    
    override func didMove(to view: SKView) {
        setupBackground()
        setupPlayer()
        player.idlePlayerAnimation()
    }




    func setupBackground() {
        let staticImages = [
            "CampBackground_1",
            "CampBackground_2",
            "CampBackground_3",
            "CampBackground_4",
            "CampBackground_5"
        ]
        let texture = SKTexture(imageNamed: "TownBackgroundL_1")
        let aspect = texture.size().width / texture.size().height
        bgWidth = size.height * aspect
        
        for (index, name) in staticImages.enumerated() {
            let bg1 = SKSpriteNode(imageNamed: name)
            bg1.anchorPoint = CGPoint(x: 0, y: 0)
            bg1.position = CGPoint(x: 0, y: 0)
            bg1.zPosition = CGFloat(index)
            addChild(bg1)
            
        }
        
        let camp = SKSpriteNode(imageNamed: "FirePlace_6")
        camp.position = CGPoint(x: 150, y: 120)
        camp.setScale(3)
        camp.anchorPoint = CGPoint(x: 0, y: 0)
        camp.zPosition = 5
        
        addChild(camp)
        
        campIdleAnimation(camp: camp)
        
    }
    
    func campIdleAnimation(camp: SKSpriteNode) {
        let textures = AnimationHelper.loadTextures(prefix: "FirePlace_", count: 1...6)
        let animation = AnimationHelper.animate(textures: textures, speed: 0.12)
        
        camp.run(animation)
            
    }
    
    func setupPlayer(){
        player = PlayerNode()
        player.anchorPoint = CGPoint(x: 0.5, y: 0)
        player.position = CGPoint(x: 100, y: -45)
        player.zPosition = 6
        
        addChild(player)
    }





}

