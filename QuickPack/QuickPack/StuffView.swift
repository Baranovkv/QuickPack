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
    var currentIndex: Int
    
    @Query(sort: \Item.name, order: .forward)
    var items: [Item]
    
    @State private var newItem = ""
    @State private var newName = ""
    @State private var isEditing = false
    @State private var editingStuffName = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
//                        Text("\(item.orderIndex) - ") // for checking .onMove
                        Button {
                            item.isChecked.toggle()
                        } label: {
                            Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                        }
                        if isEditing && item.name == editingStuffName {
                            TextField(item.name, text: $newName)
                            Spacer()
                            Button {
                                if !newName.isEmpty {
                                    item.name = newName
                                    isEditing = false
                                    editingStuffName = ""
                                    newName = ""
                                    
                                } else {
                                    isEditing = false
                                    editingStuffName = ""
                                    newName = ""
                                }
                            } label: {
                                Text("Save")
                            }
                        } else {

                            Text(item.name)
                                .onTapGesture {
                                    isEditing = true
                                    editingStuffName = item.name
                                }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
                
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
            .navigationBarTitle(currentStuffName, displayMode: .automatic)
        }
    }
    
    init(currentStuffName: String, currentIndex: Int) {
        self._items = Query(filter: #Predicate{
            $0.stuff?.name == currentStuffName}, sort: \.orderIndex)
        
        self.currentStuffName = currentStuffName
        self.currentIndex = currentIndex
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(name: newItem, stuff: Stuff(name: currentStuffName))
            newItem.orderIndex = currentIndex
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
                
                for newIndex in index..<items.endIndex {
                    items[newIndex].orderIndex -= 1
                }
            }
        }
    }
    
    private func moveItems(source: IndexSet, destination: Int) {
         
            var updatedItems = items

            updatedItems.move(fromOffsets: source, toOffset: destination)
            
            for (index, item) in updatedItems.enumerated() {
                item.orderIndex = index
            }
    }
    
}

#Preview {
    StuffView(currentStuffName: "Stuff View", currentIndex: 0)
        .modelContainer(for: Item.self, inMemory: true)
}
