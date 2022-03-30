//
//  GameScene.swift
//  lesson8
//
//  Created by 5vi5t on 23.03.2022.
//

import SpriteKit
import GameplayKit

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    
    var snake: Snake?

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true
        
        addLeftButton()
        addRightButton()
        createApple()
        
        addSnake()
        
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "leftButton" || touchNode.name == "rightButton" else { return }
            
            touchNode.fillColor = .green
            
            if touchNode.name == "leftButton" {
                snake!.moveCounterClockwise()
            } else if touchNode.name == "rightButton" {
                    snake!.moveClockwise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "leftButton" || touchNode.name == "rightButton" else { return }
            
            touchNode.fillColor = .gray
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func addLeftButton() {
        let leftButton = SKShapeNode()
        leftButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        guard let frame = view?.scene?.frame else { return }
        leftButton.position = CGPoint(x: frame.minX + 30, y: frame.minY + 30)
        
        leftButton.fillColor = UIColor.gray
        leftButton.strokeColor = UIColor.gray
        leftButton.lineWidth = 10
        leftButton.name = "leftButton"
        
        self.addChild(leftButton)
    }
    
    func addRightButton() {
        let rightButton = SKShapeNode()
        rightButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        guard let frame = view?.scene?.frame else { return }
        rightButton.position = CGPoint(x: frame.maxX - 75, y: frame.minY + 30)
        
        rightButton.fillColor = UIColor.gray
        rightButton.strokeColor = UIColor.gray
        rightButton.lineWidth = 10
        rightButton.name = "rightButton"
        
        self.addChild(rightButton)
    }
    
    func createApple() {
        guard let frame = view?.scene?.frame else { return }
        let randX = CGFloat(arc4random_uniform(UInt32(frame.maxX - 10)))
        let randY = CGFloat(arc4random_uniform(UInt32(frame.maxY - 10)))
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    func addSnake() {
        guard let frame = view?.scene?.frame else { return }
        snake = Snake(atPoint: CGPoint(x: frame.midX, y: frame.midY))
        self.addChild(snake!)
    }
}

extension GameScene: SKPhysicsContactDelegate {
 
    func didBegin(_ contact: SKPhysicsContact) {
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bodies - CollisionCategories.SnakeHead
        
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
            
        case CollisionCategories.EdgeBody:
            
            snake?.removeFromParent()
            snake = nil
            addSnake()
        default:
            break
        }
    }
    
}

