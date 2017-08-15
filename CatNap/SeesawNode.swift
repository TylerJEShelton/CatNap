//
//  SeesawNode.swift
//  CatNap
//
//  Created by Tyler Shelton on 2017-08-13.
//  Copyright © 2017 Bullfrog Development Studio. All rights reserved.
//

import SpriteKit

class SeesawNode: SKSpriteNode, EventListenerNode {

    
    func didMoveToScene() {
        
        guard let scene = scene else {
            return
        }
        
        let seesawBaseNode = childNode(withName: "seesawBase")!
        let seesawPin = SKPhysicsJointPin.joint(withBodyA:  seesawBaseNode.physicsBody!, bodyB: physicsBody!, anchor: CGPoint.zero)
        scene.physicsWorld.add(seesawPin)
    }
}
