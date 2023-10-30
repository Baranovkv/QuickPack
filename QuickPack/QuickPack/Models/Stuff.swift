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
    
    var inProgress: Bool {
        if items.isEmpty {
            return true
        } else {
            for item in items {
                if item.isChecked == false {
                    return true
                }
            }
            return false
        }
    }
    
    init(name: String = "New Bag", items: [Item] = [Item]()) {
        self.name = name
        self.items = items
    }
}
