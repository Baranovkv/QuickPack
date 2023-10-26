//
//  NewStuffView.swift
//  QuickPack
//
//  Created by Kirill Baranov on 23/10/23.
//

import SwiftUI
import SwiftData

struct NewStuffView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var isModalPresented: Bool
    var currentCollection: CollectionItem // for pre-compiled list
    @State var newStuff = Stuff(name: "")
    @State var bagName: String = ""
    @State private var isValidInput = false
    
    var body: some View {
        VStack {
            Text("Enter Bag Name")
                .bold()
                .font(.largeTitle)
                .padding()
                .position(x:200, y: 100)
            
            Image(systemName: "bag.badge.plus").resizable().scaledToFit().position(CGPoint(x: 45.0, y: -20.0)).frame(width: 100, height: 100)
        }
        
        TextField("Bag Name", text: $newStuff.name)
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20) // Задаем радиус скругления углов
            .frame(maxWidth: 300)
            .padding()
            .blur(radius: 0.0)
            .position(x:200, y: -50)
            .onChange(of: newStuff.name) { newValue in
                isValidInput = !newValue.isEmpty
            }
        
        Spacer()
        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button("Done"){
                        isModalPresented = false
                        addStuff()
                    }
                    .disabled(!isValidInput)
                }
                
            }
    }
    
    
    private func addStuff() {
        withAnimation {
            let newStuff = newStuff
            modelContext.insert(newStuff)
        }
    }
}

#Preview {
    NewStuffView(isModalPresented: .constant(false), currentCollection: CollectionList.share.collections[0])
        .modelContainer(for: Item.self, inMemory: true)
}

