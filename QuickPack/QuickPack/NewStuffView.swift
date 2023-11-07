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
    let collectionName: String
    @State var collectionItems: [String]
    
    @State var newStuff = Stuff(name: "")
    @State var currentIndex = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter Bag Name")
                    .bold()
                    .font(.largeTitle)
                
                TextField("Bag Name", text: $newStuff.name)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .padding()
                    .blur(radius: 0.0)
                
                if !collectionItems.isEmpty {
                    
                    List {
                        Section(header: Text("Items from \(collectionName) collection")) {
                            ForEach (collectionItems, id: \.self) { collectionItem in
                                Text(collectionItem)
                            }
                            .onDelete(perform: deleteItems)
                        }
                    }
                }
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
        }
    }
    
    private func addStuff() {
        withAnimation {
            let newStuff = newStuff
            modelContext.insert(newStuff)
            
            for collectionItem in collectionItems {
                let newItem = Item(name: collectionItem, stuff: newStuff)
                newItem.orderIndex = currentIndex
                modelContext.insert(newItem)
                currentIndex += 1
            }
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        collectionItems.remove(atOffsets: offsets)
    }
    
}

#Preview {
    NewStuffView(
        isModalPresented: .constant(false),
        collectionName: CollectionList.share.collections[0].name,
        collectionItems: CollectionList.share.collections[0].items
    )
    .modelContainer(for: Item.self, inMemory: true)
}

