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
    @Query private var items: [Item]
    @State private var newItem: String = ""
    var currentCollection: CollectionItem // for pre-compiled list
    var newBagName: String
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    if item.stuff?.name == newBagName {
                        HStack {
                            Text(item.name)
                            Spacer()
                            Image(systemName: item.isChecked ? "checkmark.square" : "square")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
                HStack{
                    TextField("Add Item...", text: $newItem)
                    Button(action: {
                        if !newItem.isEmpty {
                            addItem()
                            newItem = ""
                        }
                    }, label: {
                        Text("Add")
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
            }
            .navigationTitle(newBagName)
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(name: newItem, stuff: Stuff(name: newBagName))
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    NewStuffView(currentCollection: CollectionList.share.collections[0], newBagName: "New Stuff View")
        .modelContainer(for: Item.self, inMemory: true)
}
