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
		private var item : ItemSprite

		init(x: CGFloat, y: CGFloat, imageNamed: String, itemType: ItemType) {
				super.init(x, y, imageNamed)

				self.item = ItemSprite(x, y, itemType)
		}

		convenience init(x: CGFloat, y: CGFloat, imageNamed: String) {
				//TODO: random item selection
				self.init(x, y, imageNamed, randomItem)
		}

		private func spawnItem() {
				self.addChild(item)

				let riseUpAction = SKAction.move(to: CGPoint(x: self.position.x + 100, y: self.position.y + 100), duration: 1.5)
				item.run(riseUpAction, completion: handover()) // Rise item out of block
		}

		private func handover() {
				item.move() // ItemSprite class now in control of its movement
		}
}
