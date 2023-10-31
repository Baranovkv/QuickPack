//
//  NewStuffView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI
import SwiftData

struct NewStuffView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var isModalPresented: Bool
    var currentCollection: CollectionItem // for pre-compiled list
    @State var newStuff = Stuff(name: "")
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter Bag Name")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Image(systemName: "bag.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .offset(x: -14)
                
                TextField("Bag Name", text: $newStuff.name)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    .frame(maxWidth: 300)
                    .padding()
                    .blur(radius: 0.0)
            }
            
            
            
            Spacer()
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button("Done"){
                            isModalPresented = false
                            addStuff()
                        }
                        .disabled(newStuff.name == "")
                    }
                }
//                .navigationTitle("Enter Bag Name")
        }
    }
    
    private func addStuff() {
        withAnimation {
            let newStuff = newStuff
            modelContext.insert(newStuff)
            for collectionItem in currentCollection.items {
                let newItem = Item(name: collectionItem, stuff: newStuff)
                modelContext.insert(newItem)
            }
        }
    }
    
}

#Preview {
    NewStuffView(isModalPresented: .constant(false), currentCollection: CollectionList.share.collections[0])
        .modelContainer(for: Item.self, inMemory: true)
}

