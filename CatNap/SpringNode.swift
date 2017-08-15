//
//  SpringNode.swift
//  CatNap
//
//  Created by Tyler Shelton on 2017-08-09.
//  Copyright © 2017 Bullfrog Development Studio. All rights reserved.
//

import SpriteKit

class SpringNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    func didMoveToScene() {
        
        isUserInteractionEnabled = true
        
    }
    
    func interact() {
        
        isUserInteractionEnabled = false
        physicsBody!.applyImpulse(CGVector(dx: 0, dy: 250), at: CGPoint(x: size.width/2, y: size.height))
        run(SKAction.sequence([SKAction.wait(forDuration: 1), SKAction.removeFromParent()]))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("LAUNCHING!")
        interact()
    }

}
