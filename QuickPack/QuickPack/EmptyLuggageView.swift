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
            Text(Date.now.formatted(date: .long, time: .standard))
                .position(x:195, y:650)
                .font(.footnote)
            Image(systemName: "globe.europe.africa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .padding(80)
                .position(x:195, y:30)
            Text("Let's create a new bag!")
                .bold()
                .font(.largeTitle)
                .position(x:195, y:-140)
        }
        
    }
}

#Preview {
    EmptyLuggageView()
}
