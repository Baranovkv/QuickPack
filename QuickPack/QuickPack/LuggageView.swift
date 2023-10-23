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
        
        if stuff.isEmpty {
            NavigationView {
                VStack {
                    Text("Looks like you are going somewhere.")
                    Button(action: {
                        isModalPresented.toggle()
                    }) {
                        Text("Let's create a new bag")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isModalPresented) {
                        NewBagNameView()
                    }
                }
            }
        }
        
        // If user has own lists
        else {
            NavigationStack{
                List{
                    HStack {
//                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
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
}
