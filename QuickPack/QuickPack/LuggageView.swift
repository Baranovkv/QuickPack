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
            if stuff.isEmpty {
                HStack {
                    Text("Let's create a new bag! Tap the plus button").bold().font(.largeTitle)
                }
            }
            
            List{
                //  TextField("Search", text: $searchText)
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
                }
                //                    ToolbarItem(placement: .navigationBarTrailing) {
                //                        EditButton()
                //                    }
            }
            .searchable(text: $searchText, prompt: "Find your bag")
            .sheet(isPresented: $isModalPresented) {
                CollectionView(isModalPresented: $isModalPresented)
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
