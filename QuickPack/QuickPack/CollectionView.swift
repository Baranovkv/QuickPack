

import SwiftUI

struct CollectionView: View {
    
    var collectionList = CollectionList.share
    @State var newBagName = ""
    @Binding var isModalPresented: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView(content: {
                Section(header: Text("").font(.title3)) {
                    LazyVGrid(columns:
                                [GridItem(.flexible()), GridItem(.flexible())],
                              spacing: 20,
                              content: {
                        
                        NavigationLink(destination: NewStuffView(isModalPresented: $isModalPresented, currentCollection: CollectionItem(name: "FROM SCRATCH", imageName: "emptylist", items: [String]()))) {
                            CollectionCard(collection: CollectionItem(name: "FROM SCRATCH", imageName: "emptylist", items: [String]()));
                        }
                        
                    })
                }
                
                
                Section(header: Text("From Collections")
                    .font(.title2)) {
                        
                    LazyVGrid(columns:
                                [GridItem(.flexible(), spacing: 20), GridItem(.flexible())],
                              spacing: 20,
                              content: {
                        
                        ForEach (collectionList.collections) { collection in
                            
                            NavigationLink(destination: NewStuffView(isModalPresented: $isModalPresented, currentCollection: collection)) {
                                CollectionCard(collection: collection)
                            }
                        }
                    })
                }
            })

            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        isModalPresented = false
                    }
                    .foregroundStyle(Color(.red))
                }
            }
            .navigationTitle("Collect New Bag")
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(isModalPresented: .constant(false))
    }
}
