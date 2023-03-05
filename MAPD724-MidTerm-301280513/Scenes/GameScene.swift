//
//  GameScene.swift
//  ICE1
//
//   Created by Neha Patel
//  301280513
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    var gameManager: GameManager?
    
    var ocean1: Ocean?
    var ocean2: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        ocean1 = Ocean()
        ocean1?.position = CGPoint(x: 0, y: 177)
        ocean1?.size = CGSize(width: 4000, height: 4000)
        addChild(ocean1!)
        
        island = Island()
        addChild(island!)
        
        plane = Plane()
        plane?.position = CGPoint(x: -315, y: 0)
        plane?.size = CGSize(width: 70, height: 70)
        addChild(plane!)
        
        for index in 0...1
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        do{
            let sounds: [String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch
        {
            
        }
                
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -315, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -315, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -315, y: pos.y))
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
        ocean1?.Update()
        plane?.Update()
        island?.Update()
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: cloud)
        }
        CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: island!)
        
        if (ScoreManager.Lives < 1)
        {
            gameManager?.PresentEndScreen()
        }
    }
}

