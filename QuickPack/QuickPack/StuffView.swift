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
                        
                        //                        if isEditing && item.name == editingStuffName {
                        //                        } else {
                        //                        }
                        
                        
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
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    if isEditing {
            //                        Button("Done") {
            //                            isEditing = false
            //                            newName = ""
            //                        }
            //                    } else {
            //                        Button("Edit") {
            //                            isEditing = true
            //                        }
            //                    }
            //                }
            //            }
            .navigationBarTitle(currentStuffName, displayMode: .automatic)
            
        }
    }
    
    init(currentStuffName: String) {
        self._items = Query(filter: #Predicate{
            $0.stuff?.name == currentStuffName}, sort: \.name)
        
        self.currentStuffName = currentStuffName
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
