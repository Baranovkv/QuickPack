//
//  Stuff.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import Foundation
import SwiftData

@Model
final class Stuff {
    @Attribute(.unique) var name: String
    var items: [Item]
    
    init(name: String = "New Bag", items: [Item] = [Item]()) {
        self.name = name
        self.items = items
    }
}
