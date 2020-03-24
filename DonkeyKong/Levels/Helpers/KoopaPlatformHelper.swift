//
//  KoopaPlatformHelper.swift
//  DonkeyKong
//
//  Created by Travis Pell on 24/03/2020.
//  Copyright © 2020 Travis Pell. All rights reserved.
//

import Foundation
import SpriteKit

class KoopaPlatformHelper: SKNode {
    private var blockArray: [BlockSprite] 
    
    init(x: CGFloat, y: CGFloat, size: CGFloat) {
        self.blockArray = []
        super.init()
        
        for i in 0...Int(size-1) {
            blockArray.append(BlockSprite(x: x+CGFloat(i)*BlockSprite.BLOCK_SIZE, y: y, imageNamed: "block.png"))
            self.addChild(blockArray[i])
        }
        
        let koopaSprite = KoopaSprite(x: x, y: y, sizeOfPlatform: size)
        self.addChild(koopaSprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
