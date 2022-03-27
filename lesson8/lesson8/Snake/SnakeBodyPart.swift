//
//  SnakeBodyPart.swift
//  lesson8
//
//  Created by 5vi5t on 27.03.2022.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    
    let diameter: CGFloat = 10
    
    init(atPoint point: CGPoint) {
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)).cgPath
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: diameter, center: CGPoint(x: 0, y: 0))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategories.Snake
        self.physicsBody?.collisionBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
