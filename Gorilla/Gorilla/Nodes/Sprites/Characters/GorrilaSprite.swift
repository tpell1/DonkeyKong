//
//  GorillaSprite.swift
//  Gorilla
//
//  Created by Travis Pell on 27/03/2020.
//  Copyright © 2020 Travis Pell. All rights reserved.
//

import Foundation
import SpriteKit
import Physics

class GorillaSprite: SKSpriteNode {
    private var height = 100
    private var width = 80
    private var health = 10
    private var hitTimer : Timer?
    private var isHit = false
    private var origin : CGPoint
    
    init(x: CGFloat, y: CGFloat) {
        let texture = SKTexture(imageNamed: "gorilla.png") // Use the gorillaKong texture
        self.origin = CGPoint(x: x, y: y)

        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.scale(to: CGSize(width: width, height: height))
        self.position = CGPoint(x: x, y: y)
        self.name = "Gorilla"
        self.zPosition = 10
        ///////// My physics //////////
        physicsObj = PhysicsObject(withNode: self, mass: 3)
        physicsObj?.restitution = 0.4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fightMartinio(martinioPos: CGPoint) {
        let martinioX = martinioPos.x
        let martinioY = martinioPos.y
        if (!isHit) {
            if (abs(martinioX - self.position.x) < 100 && abs(martinioY - self.position.y) < 30) {
                attack(position: martinioPos)
            } else {
                walk(to: martinioPos)
            }
        }
    }
    
    private func attack(position: CGPoint) {
        self.physicsObj?.velocity.dx = 0
        self.physicsObj?.applyForce(dx: 0, dy: 165000)
        walk(to: position)
    }
    
    private func walk(to: CGPoint) {
        self.physicsObj?.velocity.dx = 0
        if (to.x > position.x) {
            self.physicsObj?.applyImpulse(dx: 850, dy: 0)
        } else {
            self.physicsObj?.applyImpulse(dx: -850, dy: 0)
        }
    }

    public func reset() {
        let action = SKAction.move(to: origin, duration: 1.5)
        self.run(action)
    }
    
    public func hit() {
        if (!isHit) {
            health -= 1
            if (health <= 0) {
                die()
            }
            isHit=true
            reset()
            self.hitTimer = Timer(timeInterval: TimeInterval(1.5), repeats: true, block: hitTime)
            RunLoop.current.add(hitTimer!, forMode: .commonModes)
        }
    }
    
    @objc func hitTime(timer: Timer) {
        isHit=false
        timer.invalidate()
    }
    
    private func die() {
        removeFromParent()
    }
    
    public func getHealth() -> Int{
        return health
    }
    
    override func removeFromParent() {
        super.removeFromParent()
        physicsObj?.index = -1
    }
}
