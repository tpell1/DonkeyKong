//
//  BlockSprite.swift
//  DonkeyKong
//
//  Created by Travis Pell on 03/03/2020.
//  Copyright © 2020 Travis Pell. All rights reserved.
//

import Foundation
import SpriteKit

class BlockSprite : SKSpriteNode {
    
    init(x: CGFloat, y: CGFloat, imageNamed: String) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
		
        self.scale(to: CGSize(width: 40, height: 40))
        self.position = CGPoint(x: x, y: y)
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: CGSize(width: 40.0, height: 40.0))
        self.physicsBody?.restitution = 0.4
        self.physicsBody?.isDynamic = false
        self.physicsBody?.contactTestBitMask = (self.physicsBody?.collisionBitMask)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
