//
//  NewBagNameView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI

struct NewBagNameView: View {
    @State var newBagName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Prepare for")
                TextField("Enter New Bag Name", text: $newBagName)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: CollectionView(newBagName: newBagName)) {
                    Text("Go!")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(newBagName.isEmpty)
            }
        }
        .onAppear {
            newBagName = ""
        }
    }
}

#Preview {
    NewBagNameView()
}
