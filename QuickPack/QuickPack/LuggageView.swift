//
//  LuggageView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI
import SwiftData

struct LuggageView: View {
    
    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]
    @Query private var stuff: [Stuff]
    @State private var isModalPresented = false
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack{
            List{
                TextField("Search", text: $searchText)
                
                if stuff.isEmpty {
//                    VStack(alignment: .leading, content: {
//                        Text("Looks like you want to prepare a trip.")
                        HStack {
                            Text("Let's create a new bag! Tap")
                            Image(systemName: "plus").foregroundColor(.blue)
                            Image(systemName: "arrow.up.right")
                        }
//                    })
                }
                
                ForEach(filteredStuff(searchText, stuff: stuff)) { stuff in
                    NavigationLink(stuff.name) {
                        StuffView(currentStuffName: stuff.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isModalPresented.toggle()
                    }) {
                        Text(Image(systemName: "plus"))
                        
                    }
                    .sheet(isPresented: $isModalPresented) {
                        NewBagNameView()
                    }
                }
                //                    ToolbarItem(placement: .navigationBarTrailing) {
                //                        EditButton()
                //                    }
            }
            .navigationTitle("Your Luggage")
        }
    }
    
    func filteredStuff(_ searchText: String, stuff: [Stuff]) -> [Stuff] {
        
        if searchText.isEmpty {
            return stuff
        } else {
            return stuff.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(stuff[index])
            }
        }
    }
}



#Preview {
    LuggageView()
        .modelContainer(for: Stuff.self, inMemory: true)
}
