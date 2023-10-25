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
                           "Travel insurance documents",
                           "Charger",
                           "Cash",
                           "Credit/debit cards",
                           "Skis, snowboard, or other equipment",
                           "Ski jacket",
                           "Ski pants",
                           "Thermal underwear",
                           "Mid-layer fleece or down jacket",
                           "Ski socks (multiple pairs)",
                           "Thermal or woolen hat",
                           "Ski gloves or mittens",
                           "Balaclava",
                           "Sunglasses with UV protection",
                           "Sunscreen with high SPF",
                           "Snow boots or ski-specific boots",
                           "Helmet (for safety)",
                           "Toiletries (toothbrush, toothpaste, soap, shampoo)",
                           "First-aid kit"
                        ]),
        
        CollectionItem(name: "RIVER TRIP",
                        imageName: "river",
                        items: [
                            "Mobile phone and portable power bank",
                            "Credit/debit cards",
                            "Life jackets",
                            "Helmets (for water sports)",
                            "Waterproof dry bags or cases for personal items",
                            "Sunscreen with high SPF",
                            "Insect repellent",
                            "First-aid kit",
                            "Multi-tool or pocket knife",
                            "Swimsuits",
                            "Quick-dry clothing for outdoor activities",
                            "Sunhat and sunglasses",
                            "Water shoes or sandals with good grip",
                            "Hat",
                            "Rainproof jacket",
                            "Extra change of clothing",
                            "Warm clothing (for cooler evenings)",
                            "Extra socks",
                            "Comfortable walking or hiking shoes",
                            "Towel",
                            "Personal medications",
                            "Soap and shampoo",
                            "Hand sanitizer",
                            "Toilet paper (if camping)",
                            "Food and snacks"
                            ]),
        CollectionItem(name: "CITY BREAK",
                        imageName: "citybreak",
                        items: [
                            "Passport",
                            "Travel insurance documents",
                            "Mobile phone and charger",
                            "Cash (in the local currency)",
                            "Credit/debit cards",
                            "Hat and sunglasses",
                            "Wet wipes",
                            "Headphones"
                            ]),
        CollectionItem(name: "CAMPING TRIP",
                        imageName: "camping",
                        items: [
                            "Passport",
                            "Travel insurance documents",
                            "Mobile phone and charger",
                            "Cash",
                            "Credit/debit cards",
                            "Tent",
                            "Sleeping bag",
                            "Hat and gloves",
                            "Camping boots",
                            "Socks",
                            "Sandals or camp shoes",
                            "Cooking pots and pans",
                            "Cookware",
                            "Portable coffee maker or kettle",
                            "Soap",
                            "Wet wipes",
                            "Trash bags",
                            "Food and snacks",
                            "Flashlight",
                            "Camping knife",
                            "Fire-starting materials (lighter, matches, firestarter)",
                            "Camping chairs or portable seating",
                            "Camp table",
                            "Toiletries (toothbrush, toothpaste, soap, shampoo)",
                            "Towel",
                            "Hand sanitizer",
                            "Toilet paper",
                            "First-aid kit",
                            "Insect repellent",
                            "Sunscreen"
                            ]),
        CollectionItem(name: "BUSINESS TRIP",
                        imageName: "business",
                        items: [
                            "Passport",
                            "Visa (if required)",
                            "Travel insurance documents",
                            "Necessary documents",
                            "Wallet with cash, credit/debit cards",
                            "Pen and notepad",
                            "Smartphone, laptop, or tablet",
                            "Charger and power bank",
                            "Headphones",
                            "Professional attire (suits, blouses)",
                            "Comfortable shoes for walking and business meetings",
                            "Extra change of clothing",
                            "Toiletry bag with essentials (toothbrush, toothpaste, razor..)",
                            "Makeup and grooming products (if applicable)",
                            "Hand sanitizer",
                            "Medications",
                            "Wet wipes"
                            ]),
      
        CollectionItem(name: "TREKKING & HIKING",
                        imageName: "trekking",
                        items: [
                            "Passport",
                            "Visa (if required)",
                            "Travel insurance documents",
                            "Wallet with cash, credit/debit cards",
                            "Smartphone",
                            "Charger and power bank",
                            "Headphones",
                            "Hand sanitizer",
                            "Medications",
                            "Wet wipes",
                            "Hiking Boots",
                            "Quick-drying shirts and pants",
                            "Jacket",
                            "Waterproof and windproof outer layers",
                            "Hat, gloves, and buff/scarf",
                            "Extra socks and underwear",
                            "Water bottles",
                            "Snacks",
                            "Meals if trekking in a remote area",
                            "Cookware",
                            "Tent",
                            "Sleeping bag",
                            "Sunscreen",
                            "Sunglasses",
                            "Sunhat",
                            "Insect repellent",
                            "Flashlight: With extra batteries",
                            "Multi-Tool/Knife",
                            "Garbage Bags"
                            ]),
        
        CollectionItem(name: "CULTURE TRIP",
                        imageName: "history",
                        items: [
                            "Passport",
                            "Travel insurance documents",
                            "Wallet with cash, credit/debit cards",
                            "Smartphone",
                            "Charger and power bank",
                            "Headphones",
                            "Comfortable walking shoes or sneakers",
                            "Camera",
                            "Sunglasses",
                            "Hat",
                            "Packable umbrella",
                            "water bottle"
                            ])
    ])
    
    private init(collections: [CollectionItem]) {
        self.collections = collections
    }
}
