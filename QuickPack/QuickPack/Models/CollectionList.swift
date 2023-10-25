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
        CollectionItem(name: "SEA & BEACH",
                        imageName: "seaandbeach",
                        items: [
                          "Passport",
                          "Phone",
                          "Insurance documents",
                          "Charger",
                          "Cash",
                          "Credit/debit cards",
                          "Swimwear",
                          "Sunglasses",
                          "Sunscreen",
                          "Light clothing",
                          "Slippers",
                          "Hat",
                          "Toiletries (toothbrush, toothpaste)",
                          "First-aid kit",
                          "Insect repellent",
                          "Beach towels"
                        ]),
        
        CollectionItem(name: "SKIING",
                        imageName: "skiing",
                        items: [
                           "Passport",
                           "Phone",
                           "Tent",
                           "Water",
                           "Repellent"
                        ]),
        
        CollectionItem(name: "RIVER TRIP",
                        imageName: "river",
                        items: [
                            ]),
        CollectionItem(name: "CITY BREAK",
                        imageName: "citybreak",
                        items: [
                            ]),
        CollectionItem(name: "CAMPING TRIP",
                        imageName: "camping",
                        items: [
                            ]),
        CollectionItem(name: "BUSINESS TRIP",
                        imageName: "business",
                        items: [
                            ])
    ])
    
    private init(collections: [CollectionItem]) {
        self.collections = collections
    }
}
