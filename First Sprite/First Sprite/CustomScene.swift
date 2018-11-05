import SpriteKit

class CustomScene: SKScene {
    let crab = SKSpriteNode()
    
    
    override func sceneDidLoad() {
    // We have to override the sceneDidLoad because the SKScene has a
    // has default sceneDidLoad()
        
        super.sceneDidLoad()
        addChild(crab)
        crab.loadTextures(named: "HappyCrab", forKey: SKSpriteNode.textureKey)
        
        // Our sprite needs a position otherwise it will be be
        // displayed in  a random position.
        crab.position = CGPoint(x: frame.midX, y: frame.midY)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Fetch a touch or leave
        guard !touches.isEmpty, let touch = touches.first else { return }
        
        // Retrieve position
        let position = touch.location(in: self)
        
        // Create move action
        let actionDuration = 1.0
        let moveAction = SKAction.move(to: position, duration: actionDuration)
        let turnAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: actionDuration)
        let groupAction = SKAction.group([moveAction, turnAction])
        crab.run(groupAction)
        
        // Run move action
        //crab.run(moveAction)
    }
}
