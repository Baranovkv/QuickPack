//
//  Item.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var isChecked: Bool
    var stuff: Stuff?
    
    var orderIndex: Int = 0
    
    init(name: String, isChecked: Bool = false, stuff: Stuff) {
        self.name = name
        self.isChecked = isChecked
        self.stuff = stuff
//        self.orderIndex = orderIndex
    }
}
