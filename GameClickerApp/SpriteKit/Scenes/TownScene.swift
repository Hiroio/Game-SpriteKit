//
//  TownScene.swift
//  GameClickerApp
//
//  Created by Vladuslav on 15.10.2025.
//
import SpriteKit


class TownScene: SKScene {
    var cameraNode = SKCameraNode()
    var player: PlayerNode!
    var npcs: [NPCNode] = []
    var staticLayers: [SKSpriteNode] = []
    var cloudLayer: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        setupBackground()
        setupPlayer()
        player.idlePlayerAnimation()
        setupNPCs()
    }




    func setupBackground() {
        let staticImages = [
            "TownBackgroundL_1",
            "TownBackgroundL_2",
            "TownBackgroundL_3"
        ]
        let texture = SKTexture(imageNamed: "TownBackgroundL_1")
        let aspect = texture.size().width / texture.size().height
        let bgWidth = size.height * aspect
        
        for (index, name) in staticImages.enumerated() {
            // перша половина
            let bg1 = SKSpriteNode(imageNamed: name)
            bg1.anchorPoint = CGPoint(x: 0, y: 0)
            bg1.position = CGPoint(x: 0, y: 0)
            bg1.zPosition = CGFloat(index)
            bg1.size = CGSize(width: bgWidth, height: size.height)
            addChild(bg1)
            
            // друга половина праворуч (подвоюємо)
            let bg2 = SKSpriteNode(imageNamed: name)
            bg2.anchorPoint = CGPoint(x: 0, y: 0)
            bg2.position = CGPoint(x: bg1.size.width, y: 0)
            bg2.size = bg1.size
            bg2.zPosition = CGFloat(index)
            addChild(bg2)
        }
    }
//    func setupCamera() {
//        camera = cameraNode
//        cameraNode.position = CGPoint(x: -size.width / 2, y: 0)
//        addChild(cameraNode)
//    }
//
//
//    override func didSimulatePhysics() {
//        guard let player = player else { return }
//        
//        let cameraHalfWidth = size.width / 2
//        let worldLeft = -size.width / 2
//        let worldRight = size.width * 1.5
//        
//        var cameraX = player.position.x
//        cameraX = max(worldLeft + cameraHalfWidth, min(cameraX, worldRight - cameraHalfWidth))
//        
//        cameraNode.position = CGPoint(x: cameraX, y: 0)
//        
//        // хмари рухаються разом
//        cloudLayer.position.x = cameraX
//    }



    func setupPlayer() {
        player = PlayerNode()
        player.zPosition = 8
        player.anchorPoint = CGPoint(x: 0, y: 0)
        player.position = CGPoint(x: -150, y: -130)
        
        addChild(player)
    }
    
    

    func setupNPCs() {
        let npc1 = NPCNode(type: .quest)
        npc1.anchorPoint = CGPoint(x: 0, y: 0)
        npc1.position = CGPoint(x: size.width * 0.5, y: 20)
        
        addChild(npc1)
        
        npcs = [npc1]
    }



//    func setupNPCs() {
//        let shopNPC = NPCNode(type: .shop)
//        shopNPC.position = CGPoint(x: size.width * 0.8, y: 200)
//        addChild(shopNPC)
//        npcs.append(shopNPC)
//    }


    func updateCamera() {
        // Центруємо камеру на гравцеві (якщо хочеш прокрутку)
        camera?.position.x = player.position.x
    }
}
