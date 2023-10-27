//
//  EmptyLuggageView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 27/10/23.
//

import SwiftUI

struct EmptyLuggageView: View {
    var body: some View {
        Text("Let's create a new bag! Tap the plus button").bold().font(.largeTitle).position(x:200, y:200)
    }
}

#Preview {
    EmptyLuggageView()
}
