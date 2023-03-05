//
//  CollisionManager.swift
//  ICE3
//
//  Created by Neha Patel
//  301280513

import SpriteKit
import GameplayKit

class CollisionManager
{
    public static var gameViewController: GameViewController?
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquaredRadiusCheck(scene: SKScene, object1: Gameobject, object2: Gameobject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        //let P1Radius = object1.halfheight!
        //let P2Radius = object2.halfheight!
        let P1height = object1.height! * 0.5
        let P2height = object2.height! * 0.5
        let heights = P1height + P2height
        
        if(SquaredDistance(point1: P1, point2: P2) < heights * heights)
        {
            if(!object2.isColliding!)
            {
                switch(object2.name)
                {
                case "island":
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    break
                case "cloud":
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
