//
//  CollectionItem.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import Foundation

struct CollectionItem:Identifiable, Hashable {
    var name: String
    var id: String
    var imageName: String
    var items: [String]
    
    init(name: String, imageName: String, items: [String]) {
        self.name = name
        self.id = name
        self.imageName = imageName
        self.items = items
    }
}
