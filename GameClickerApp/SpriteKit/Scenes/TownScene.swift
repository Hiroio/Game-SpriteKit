//
//  TownScene.swift
//  GameClickerApp
//
//  Created by Vladuslav on 15.10.2025.
//
import SpriteKit


class TownScene: SKScene {
    var controller: TownController?
    var cameraNode = SKCameraNode()
    var player: PlayerNode!
    var npcs: [NPCNode] = []
    var staticLayers: [SKSpriteNode] = []
    var bgWidth: CGFloat = 0
    
    override func didMove(to view: SKView) {
        setupBackground()
        setupNPCs()
        setupPlayer()
        player.idlePlayerAnimation()
        setupCamera()
    }




    func setupBackground() {
        let staticImages = [
            "TownBackgroundL_1",
            "TownBackgroundL_2",
            "TownBackgroundL_3",
            "TownBackgroundL_4",
            "TownBackgroundL_5",
            "TownBackgroundL_6",
            "TownBackgroundL_7"
        ]
        let texture = SKTexture(imageNamed: "TownBackgroundL_1")
        let aspect = texture.size().width / texture.size().height
        bgWidth = size.height * aspect
        
        for (index, name) in staticImages.enumerated() {
            let bg1 = SKSpriteNode(imageNamed: name)
            bg1.anchorPoint = CGPoint(x: 0, y: 0)
            bg1.position = CGPoint(x: 0, y: 0)
            bg1.zPosition = CGFloat(index)
            bg1.size = CGSize(width: bgWidth, height: size.height)
            addChild(bg1)
            
            
            let bg2 = SKSpriteNode(imageNamed: name)
            bg2.anchorPoint = CGPoint(x: 0, y: 0)
            bg2.position = CGPoint(x: bg1.size.width, y: 0)
            bg2.size = bg1.size
            bg2.zPosition = CGFloat(index)
            addChild(bg2)
        }
        
        let church = SKSpriteNode(imageNamed: "Church")
        church.position = CGPoint(x: bgWidth * 1.6, y: 80)
        church.setScale(2)
        church.anchorPoint = CGPoint(x: 0, y: 0)
        church.zPosition = 4
        
        addChild(church)
        
    }





    func setupPlayer() {
        player = PlayerNode()
        player.zPosition = 5
        player.anchorPoint = CGPoint(x: 0.5, y: 0)
        player.position = CGPoint(x: 50, y: -130)
        
        addChild(player)
    }
    
    func setupCamera() {
        camera = cameraNode
        addChild(cameraNode)
        
        cameraNode.position = CGPoint(x: player.position.x, y: size.height / 2)
    }

    

    func setupNPCs() {
        let npc1 = NPCNode(type: .shop)
        let npc2 = NPCNode(type: .quest)
        let npc3 = NPCNode(type: .healer)
        
        npc1.position = CGPoint(x: bgWidth * 0.3, y: 25)
        npc2.position = CGPoint(x: bgWidth * 0.9, y: 35)
        npc3.position = CGPoint(x: bgWidth * 1.5, y: 25)
        
        [npc1, npc2, npc3].forEach {
            $0.anchorPoint = CGPoint(x: 0, y: 0)
            $0.zPosition = 5
            addChild($0)
        }
        
        npcs = [npc1, npc2, npc3]
    }
    

    override func update(_ currentTime: TimeInterval) {
        let halfWidth = size.width / 2
        let minX = halfWidth
        let maxX = bgWidth * 2 - halfWidth  // якщо у тебе 2х фон

        let targetX = player.position.x
        let clampedX = max(min(targetX, maxX), minX)
        cameraNode.position.x = clampedX
    }



    
    


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if location.x > player.position.x {
            moveToNearestNPC(direction: .right)
        }else{
            moveToNearestNPC(direction: .left)
        }
    }


    func moveToNearestNPC(direction: Direction) {
        guard !npcs.isEmpty else { return }

        let playerX = player.position.x
        
        let candidates: [NPCNode]
        switch direction {
        case .left:
            candidates = npcs.filter { $0.position.x < playerX - 300 }
        case .right:
            candidates = npcs.filter { $0.position.x > playerX + 150 }
        }
        
        
        guard let targetNPC = candidates.min(by: {
            abs($0.position.x - playerX) < abs($1.position.x - playerX)
        }) else {
//            NO NPC IN THAT WAY
            return
        }
        movePlayer(to: targetNPC.position.x - (direction == .right ? -250 : -250), npc: targetNPC)
    }
    
    func movePlayer(to targetX: CGFloat, npc: NPCNode) {
        print(targetX, player.position.x)
        if targetX < player.position.x{
            player.xScale = -1
        }else{
            player.xScale = 1
        }
        player.removeAction(forKey: "move")
        
        let duration = abs(targetX - player.position.x) / 250.0
        let moveAction = SKAction.moveTo(x: targetX, duration: duration)
        
        
        let idle = SKAction.run { [weak self] in
            self?.player.idlePlayerAnimation()
        }
        
        let lookAtNPC = SKAction.run {
            let npcDirection: CGFloat = targetX > self.player.position.x ? 1 : -1
            self.player.xScale = abs(self.player.xScale) * npcDirection
        }
        
        player.runPlayerAnimation()
        
        let sequence = SKAction.sequence([moveAction, lookAtNPC, idle])
        player.run(sequence, withKey: "move")
        
        switch npc.type {
        case .shop:
            controller?.changeState(to: .shop)
        case .quest:
            controller?.changeState(to: .quest)
        case .healer:
            controller?.changeState(to: .healer)
        }

        
        
        
    }




}



enum Direction {
    case left, right
}
