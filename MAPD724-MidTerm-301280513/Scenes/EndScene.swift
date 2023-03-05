//
//  EndScene.swift
//  ICE4
//
//  Created by Neha Patel
//  301280513

import SpriteKit
import GameplayKit
class EndScene: SKScene
{
    var ocean1: Ocean?
    var ocean2: Ocean?
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        name = "END"
        ocean2 = Ocean()
        ocean2?.position = CGPoint(x: 0, y: 177)
        ocean2?.size = CGSize(width: 4000, height: 4000)
        addChild(ocean2!)
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
       
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean2?.Update()
    }
}

