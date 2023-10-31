//
//  CollectionCard.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI

struct CollectionCard: View {
    
    var collection: CollectionItem

    var body: some View {
        ZStack(alignment: .leading) {
            
            Image(collection.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(collection.name.capitalized)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
            }
            
            .foregroundColor(.white)
            .padding()
            
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CollectionCard(collection: CollectionList.share.collections[0])
}
