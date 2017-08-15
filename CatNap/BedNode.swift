//
//  BedNode.swift
//  CatNap
//
//  Created by Tyler Shelton on 2017-07-22.
//  Copyright © 2017 Bullfrog Development Studio. All rights reserved.
//

import SpriteKit

class BedNode: SKSpriteNode, EventListenerNode {
    
    func didMoveToScene() {
        print("bed added to scene")
        
        let bedBodySize = CGSize(width: 40.0, height: 30.0)
        physicsBody = SKPhysicsBody(rectangleOf: bedBodySize)
        physicsBody!.isDynamic = false
        physicsBody!.categoryBitMask = PhysicsCategory.Bed
        physicsBody!.collisionBitMask = PhysicsCategory.None
    }
}
