//
//  CollectionView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI

struct CollectionView: View {
    
    var collectionList = CollectionList.share
    var newBagName: String

    var body: some View {
        
        NavigationStack{
            
            List {
                    LazyVGrid(columns:
                                [GridItem(.flexible(), spacing: 20, alignment: .center),
                                 GridItem(.flexible(), spacing: 20, alignment: .center)],
                              content: {
                        CollectionCard(collection: CollectionItem(name: "From Stratch", imageName: "emptylist", items: [String]()), newBagName: newBagName)
                    })
                
                
                Section(header: Text("From Collections").font(.headline)) {
                    
                    LazyVGrid(columns:
                                [GridItem(.flexible(), spacing: 20, alignment: .center),
                                 GridItem(.flexible(), spacing: 20, alignment: .center)],
                              content: {
                        
                        ForEach (collectionList.collections) { collection in
                            CollectionCard(collection: collection, newBagName: newBagName)
                        }
                        
                    })
                    .navigationTitle(newBagName)
                }
            }
        }
    }
}


#Preview {
    CollectionView(newBagName: "New Bag")
}
