//
//  StuffView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI
import SwiftData

struct StuffView: View {
    
    @Environment(\.modelContext) private var modelContext
    var currentStuffName: String
    @Query private var items: [Item]
    @State private var newItem: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    if item.stuff?.name == currentStuffName {
                        HStack {
                            Text(item.name)
                            Spacer()
                            Button {
                                item.isChecked.toggle()
                            } label: {
                                Image(systemName: item.isChecked ? "checkmark.square" : "square")
                            }
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
            .navigationTitle(currentStuffName)
//        } detail: {
//            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(name: newItem, stuff: Stuff(name: currentStuffName))
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
    StuffView(currentStuffName: "Stuff View")
        .modelContainer(for: Item.self, inMemory: true)
}
