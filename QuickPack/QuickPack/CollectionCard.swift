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
            
            //
            //            LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading) {
                Text(collection.name)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                
            }
            //                .foregroundColor(collection.imageName == "emptylist" ? .black : .white)
            .foregroundColor(.white)
            .padding()
            
            
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CollectionCard(collection: CollectionList.share.collections[0])
}
