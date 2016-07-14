//
//  GameScene.swift
//  HoppyBunny
//
//  Created by Simone Brown on 7/11/16.
//  Copyright (c) 2016 Simone Brown. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var hero: SKSpriteNode!
    var sinceTouch : CFTimeInterval = 0
    let fixedDelta: CFTimeInterval = 1.0/60.0 /* 60 FPS */
    let scrollSpeed: CGFloat = 160
    var scrollLayer: SKNode!
    
    override func didMoveToView(view: SKView) {
        hero = self.childNodeWithName("//hero") as! SKSpriteNode
        /* Set up your scene here */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        hero.physicsBody?.applyImpulse(CGVectorMake(0, 250))
        
        
        let flapSFX = SKAction.playSoundFileNamed("sfx_flap", waitForCompletion: false)
        
        self.runAction(flapSFX)
        
        /* Called when a touch begins */
        hero.physicsBody?.applyAngularImpulse(1)
        sinceTouch = 0
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        let velocityY = hero.physicsBody?.velocity.dy ?? 0
        
        /* Check and cap vertical velocity */
        if velocityY > 400 {
            hero.physicsBody?.velocity.dy = 400
            /* Apply falling rotation */
            if sinceTouch > 0.1 {
                let impulse = -20000 * fixedDelta
                hero.physicsBody?.applyAngularImpulse(CGFloat(impulse))
                /* Set reference to scroll layer node */
                scrollLayer = self.childNodeWithName("scrollLayer")
            }
            
            /* Clamp rotation */
            hero.zRotation.clamp(CGFloat(-20).degreesToRadians(),CGFloat(30).degreesToRadians())
            hero.physicsBody?.angularVelocity.clamp(-2, 2)
            /* Process world scrolling */
            
            /* Update last touch timer */
            sinceTouch+=fixedDelta
            //right here/* Process world scrolling */
            /* Process world scrolling */
//            scrollWorld()
            
            
        }
        /* Called before each frame is rendered */
    }
//    func scrollWorld() {
//        /* Loop through scroll layer nodes */
//        for ground in scrollLayer.children as! [SKSpriteNode] {
//            /* Get ground node position, convert node position to scene space */
//            let groundPosition = scrollLayer.convertPoint(ground.position, toNode: self)
//            /* Check if ground sprite has left the scene */
//            if groundPosition.x <= -ground.size.width / 2 {
//                /* Reposition ground sprite to the second starting position */
//                let newPosition = CGPointMake( (self.size.width / 2) + ground.size.width, groundPosition.y
//                    /* Convert new node position back to scroll layer space */
//                    ground.position = self.convertPoint(newPosition, toNode: scrollLayer)
//            }
//            
//            
//            
//            
//            
//            /* Scroll World */
//            let scrollSpeed: CGFloat = 160
//            scrollLayer.position.x -= scrollSpeed * CGFloat(fixedDelta)
//            
//            
//            
//        }
}





