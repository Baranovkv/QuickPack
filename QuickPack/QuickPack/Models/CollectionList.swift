//
//  CollectionList.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import Foundation

struct CollectionList {
    
    let collections: [CollectionItem]
    
    static let share = CollectionList(collections: [
        CollectionItem(name: "Sea And Beach",
                        imageName: "seaandbeach",
                        items: [
                          "Passport",
                          "Phone",
                          "Towel",
                          "Sunglasses",
                          "Sunscreen",
                          "Slippers"
                        ]
                       ),
        
        CollectionItem(name: "Mountains",
                        imageName: "mountains",
                        items: [
                           "Passport",
                           "Phone",
                           "Tent",
                           "Water",
                           "Repellent"
                        ])
    ])
    
    private init(collections: [CollectionItem]) {
        self.collections = collections
    }
}
