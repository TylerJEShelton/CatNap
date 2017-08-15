//
//  HintNode.swift
//  CatNap
//
//  Created by Tyler Shelton on 2017-08-14.
//  Copyright © 2017 Bullfrog Development Studio. All rights reserved.
//

import SpriteKit

class HintNode: SKSpriteNode, EventListenerNode, InteractiveNode {

    var arrowPath: CGPath = {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0.5, y: 65.69))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 1.5))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 38.66))
        bezierPath.addLine(to: CGPoint(x: 257.5, y: 38.66))
        bezierPath.addLine(to: CGPoint(x: 257.5, y: 92.72))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 92.72))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 126.5))
        bezierPath.addLine(to: CGPoint(x: 0.5, y: 65.69))
        bezierPath.close()
        return bezierPath.cgPath
    }()
    
    var randomColor = 4
    
    func didMoveToScene() {
        
        let shapeColors = [SKColor.white, SKColor.red, SKColor.gray, SKColor.blue, SKColor.green, SKColor.orange, SKColor.yellow]
        
        let shape = SKShapeNode(path: arrowPath)

        isUserInteractionEnabled = true
        
        color = SKColor.clear
        
        
        shape.strokeColor = SKColor.gray
        shape.lineWidth = 4
        //shape.glowWidth = 5
        
        shape.fillTexture = SKTexture(imageNamed: "wood_tinted")
        shape.fillColor = shapeColors[randomColor]
        shape.alpha = 0.8
        addChild(shape)
        
        let move = SKAction.moveBy(x: -40, y: 0, duration: 1.0)
        let bounce = SKAction.sequence([move, move.reversed()])
        let bounceAction = SKAction.repeat(bounce, count: 3)
        
        shape.run(bounceAction, completion: {self.removeFromParent()})
        

    }
    
    func interact() {
        //print("working")
        randomColor = Int(arc4random_uniform(7))
      }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        interact()
    }
}
