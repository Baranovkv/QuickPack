//
//  LuggageWithStuffView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 27/10/23.
//

import SwiftUI
import SwiftData

struct LuggageWithStuffView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var stuff: [Stuff]
    @State private var isModalPresented = false
    @State private var searchText = ""
    
    var body: some View {
            
            List{
                                
                ForEach(filteredStuff(searchText, stuff: stuff)) { stuff in
                    NavigationLink(stuff.name) {
                        StuffView(currentStuffName: stuff.name)
                    }
                }
                .onDelete(perform: deleteItems)
                
            }
            .searchable(text: $searchText, prompt: "Find your bag")
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
    LuggageWithStuffView()
        .modelContainer(for: Stuff.self, inMemory: true)
}
