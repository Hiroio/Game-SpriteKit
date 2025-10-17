import SpriteKit

class GameScene: SKScene {
    var enemyModel: EnemyModel!
    var enemy: EnemyNode!
    var player: PlayerNode!
    var swingDirection = 60
    var backgroundLayers: [SKSpriteNode] = []
    
    init(enemyModel: EnemyModel) {
        self.enemyModel = enemyModel
        super.init(size: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func didMove(to view: SKView) {
        setupParallaxBackground()
        
        player = PlayerNode()
        player.position = CGPoint(x: size.width / 3, y: size.height / 3)
        player.zPosition = 2
        addChild(player)
        
        enemy = EnemyNode(model: enemyModel)
        enemy.position = CGPoint(x: size.width / 1.2, y: size.height / 3)
        enemy.zPosition = 2
        addChild(enemy)

        player.idlePlayerAnimation()
        enemy.idleEnemyAnimation()
    }
    
    func resetEnemy(){
        
    }
    
    func setupParallaxBackground() {
        let backgrounds = [
            ("backgroundForestl_1", 0.2), // найдальший
            ("backgroundForestl_2", 0.5), // середній
            ("backgroundForestl_3", 1.0)  // передній
        ]
        
        for (index, bg) in backgrounds.enumerated() {
            print(index, bg.0)
            let texture = SKTexture(imageNamed: bg.0)
            let node = SKSpriteNode(texture: texture)
            node.zPosition = CGFloat(index)
            node.anchorPoint = CGPoint.zero
            node.size = CGSize(width: size.width * ((size.height/1.3) / node.size.height), height: size.height/1.3)
            node.position = CGPoint(x: 0, y: size.height - node.size.height)
            
            
            // дублюємо ще одну копію праворуч для seamless scroll
            let node2 = SKSpriteNode(texture: texture)
            node2.anchorPoint = CGPoint.zero
            node2.position = CGPoint(x: node.size.width, y: size.height - node.size.height)
            node2.zPosition = node.zPosition
            node2.size = node.size
            
            addChild(node)
            addChild(node2)
            backgroundLayers.append(contentsOf: [node, node2])
            
            // Анімація руху фону
            let moveLeft = SKAction.moveBy(x: -texture.size().width, y: 0, duration: 30 / bg.1)
            let reset = SKAction.moveBy(x: texture.size().width, y: 0, duration: 0)
            let loop = SKAction.repeatForever(SKAction.sequence([moveLeft, reset]))
            node.run(loop)
            node2.run(loop)
        }
        let texture = SKTexture(imageNamed: "topTile")
        texture.filteringMode = .nearest // для піксельного вигляду
        
        // Розрахунок, скільки тайлів потрібно по ширині
        let tileWidth = texture.size().width
        let tilesCount = Int(ceil(size.width / tileWidth)) + 1
        
        for i in 0..<tilesCount {
            let tile = SKSpriteNode(texture: texture)
            tile.anchorPoint = CGPoint.zero
            tile.position = CGPoint(x: CGFloat(i) * tileWidth, y: 200)
            tile.zPosition = 3
            addChild(tile)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let _ = touch.location(in: self)
        enemy.takeHit()
        player.makeHit()
    }
    
    func showDamage(at position: CGPoint, amount: Int, isCritical: Bool = false) {
        let damageLabel = SKLabelNode(fontNamed: "Press Start 2P")
        damageLabel.text = "-\(amount)"
        damageLabel.fontSize = isCritical ? 26 : 18
        damageLabel.fontColor = isCritical ? .yellow : .red
        damageLabel.position = CGPoint(x: position.x, y: position.y + 40)
        damageLabel.zPosition = 10
        addChild(damageLabel)
        
        let moveUp = SKAction.moveBy(x: 0, y: 50, duration: 0.8)
        let fadeOut = SKAction.fadeOut(withDuration: 0.8)
        let group = SKAction.group([moveUp, fadeOut])
        let remove = SKAction.removeFromParent()
        
        damageLabel.run(SKAction.sequence([group, remove]))
    }
    
    func NextEnemy() {
        enemyModel.resetEnemy()

        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        enemy.run(fadeOut) { [weak self] in
            guard let self = self else { return }
            
            self.enemy.removeFromParent()
            
            let newEnemy = EnemyNode(model: self.enemyModel)
            newEnemy.position = CGPoint(x: self.size.width / 1.2, y: self.size.height / 3)
            newEnemy.zPosition = 2
            newEnemy.alpha = 0
            self.addChild(newEnemy)
            self.enemy = newEnemy
            
            let fadeIn = SKAction.fadeIn(withDuration: 0.3)
            newEnemy.run(fadeIn) {
                newEnemy.idleEnemyAnimation()
            }
        }
    }
}
