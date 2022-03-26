//
//  GameScene.swift
//  lesson8
//
//  Created by 5vi5t on 23.03.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true
        
        addLeftButton()
        addRightButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func addLeftButton() {
        let leftButton = SKShapeNode()
        leftButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        leftButton.position = CGPoint(x: view!.scene!.frame.minX + 30, y: view!.scene!.frame.minY + 30)
        
        leftButton.fillColor = UIColor.gray
        leftButton.strokeColor = UIColor.gray
        leftButton.lineWidth = 10
        leftButton.name = "leftButton"
        
        self.addChild(leftButton)
    }
    
    func addRightButton() {
        let rightButton = SKShapeNode()
        rightButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        rightButton.position = CGPoint(x: view!.scene!.frame.maxX - 75, y: view!.scene!.frame.minY + 30)
        
        rightButton.fillColor = UIColor.gray
        rightButton.strokeColor = UIColor.gray
        rightButton.lineWidth = 10
        rightButton.name = "leftButton"
        
        self.addChild(rightButton)
    }
}
