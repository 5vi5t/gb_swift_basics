//
//  GameViewController.swift
//  lesson8
//
//  Created by 5vi5t on 23.03.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        
        guard let skView = view as? SKView else { return }
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        
        skView.presentScene(scene)
        }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
