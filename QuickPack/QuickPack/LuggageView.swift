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
        else {
            NavigationStack{
                List{
                    ForEach(stuff) { stuff in
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
