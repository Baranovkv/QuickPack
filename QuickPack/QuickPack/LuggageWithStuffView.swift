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
    @Query var stuff: [Stuff]
    @State private var isModalPresented = false
    @State private var searchText = ""
    
    var body: some View {
        
        List{
            if !stuff.filter({$0.inProgress == true}).isEmpty {
                
                Section(header: Text("Actual")
                    .font(.headline)
                    .textCase(nil)
                ) {
                    
                    ForEach(filteredStuff(searchText, stuff: stuff.filter{$0.inProgress == true})) { stuff in
                        HStack {
                            Image(systemName: "bag")
                            NavigationLink(stuff.name) {
                                StuffView(currentStuffName: stuff.name)
                            }
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                deleteStuff(stuff: stuff)
                            }
                        }
                    }
                }
            }
            
            if !stuff.filter({$0.inProgress == false}).isEmpty {
                Section(header: Text("Completed")
                    .font(.headline)
                    .textCase(nil)
                ) {
                    ForEach(filteredStuff(searchText, stuff: stuff.filter{$0.inProgress == false})) { stuff in
                        HStack {
                            Image(systemName: "bag.fill")
                            NavigationLink(stuff.name) {
                                StuffView(currentStuffName: stuff.name)
                            }
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                deleteStuff(stuff: stuff)
                            }
                        }
                    }
                }
            }
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
    
    private func deleteStuff(stuff: Stuff) {
        modelContext.delete(stuff)
    }
}

#Preview {
    LuggageWithStuffView()
        .modelContainer(for: Stuff.self, inMemory: true)
}
