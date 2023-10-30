//
//  EmptyLuggageView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 27/10/23.
//

import SwiftUI

struct EmptyLuggageView: View {
    var body: some View {
        VStack{
            Image("travelbag")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .padding(20)
            Text("Let's create a new bag!")
                .bold()
                .font(.title)
        }
    }
}

#Preview {
    EmptyLuggageView()
}
