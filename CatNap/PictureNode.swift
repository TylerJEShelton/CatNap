//
//  PictureNode.swift
//  CatNap
//
//  Created by Tyler Shelton on 2017-08-13.
//  Copyright © 2017 Bullfrog Development Studio. All rights reserved.
//

import SpriteKit

class PictureNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    func didMoveToScene() {
        
        isUserInteractionEnabled = true
        
        let pictureNode = SKSpriteNode(imageNamed: "picture")
        let maskNode = SKSpriteNode(imageNamed: "picture-frame-mask")
        
        let cropNode = SKCropNode()
        cropNode.addChild(pictureNode)
        cropNode.maskNode = maskNode
        addChild(cropNode)
    }

    
    func interact() {
        isUserInteractionEnabled = false
        physicsBody!.isDynamic = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        interact()
    }
}
