//
//  ItemBlockSprite.swift
//  DonkeyKong
//
//  Created by Travis Pell on 04/03/2020.
//  Copyright © 2020 Travis Pell. All rights reserved.
//

import Foundation
import SpriteKit

class ItemBlockSprite: BlockSprite {
	private var itemType : ItemType
    private var itemUsed : Bool
	
	init(x: CGFloat, y: CGFloat, imageNamed: String, itemType: ItemType) {
        self.itemType = itemType
        self.itemUsed = false
        
        super.init(x: x, y: y, imageNamed: imageNamed)
	}

    convenience override init(x: CGFloat, y: CGFloat, imageNamed: String) {
		//TODO: random item selection
        self.init(x: x, y: y, imageNamed: imageNamed, itemType: ItemType.ONEUP)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	
	func spawnItem() {
        if (!itemUsed) {
            itemUsed = true
            let item = ItemSprite(x: self.position.x, y: self.position.y, itemType: itemType)
            self.addChild(item)
            
            let riseUpAction = SKAction.move(to: CGPoint(x: self.position.x, y: self.position.y), duration: 1.5)
            item.run(riseUpAction, completion: item.move)
        }
	}
}