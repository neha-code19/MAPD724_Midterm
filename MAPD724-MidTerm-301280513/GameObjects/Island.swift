//
//  Island.swift
//  ICE2
//
//  Created by Neha Patel
//  301280513

import GameplayKit
import SpriteKit

class Island : Gameobject
{
    
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds()
    {
        if(position.x <= -730)
        {
            Reset()
        }
    }
    override func Reset()
    {
        position.x = 730
        let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        position.y = CGFloat(randomX)
        isColliding = false
    }
    
    override func Start()
    {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
    }
    override func Update()
    {
        Move()
        CheckBounds()
    }
    func Move()
    {
        position.x -= verticalSpeed!
    }
}

