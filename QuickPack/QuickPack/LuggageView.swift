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
    @Query private var stuff: [Stuff]
    @State private var isModalPresented = false
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                if stuff.isEmpty {
                    EmptyLuggageView()
                } else {
                    LuggageWithStuffView()
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isModalPresented.toggle()
                    }) {
                        Text(Image(systemName: "plus"))
                        
                    }
                }
                
            }
            .sheet(isPresented: $isModalPresented) {
                CollectionView(isModalPresented: $isModalPresented)
            }
            .navigationBarTitle("Your Luggage", displayMode: .automatic)
        }
    }
}

#Preview {
    LuggageView()
        .modelContainer(for: Stuff.self, inMemory: true)
}
