//
//  CollectionCard.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI

struct CollectionCard: View {
    
    var collection: CollectionItem
    var newBagName: String
    
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                
                Image(collection.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(maxWidth: 200, maxHeight: .infinity)
                    .clipped()
                   
                //
                //            LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .center) {
                    Text(collection.name)
                        .font(.title2)
                        .bold()
                    
                }
                .foregroundColor(collection.imageName == "emptylist" ? .black : .white)
                .padding()
                
                if newBagName != "" {
                    NavigationLink(destination: NewStuffView(currentCollection: collection, newBagName: newBagName)) {
                        EmptyView()
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
}

#Preview {
    CollectionCard(collection: CollectionList.share.collections[0], newBagName: "New bag")
}
