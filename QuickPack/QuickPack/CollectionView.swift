

import SwiftUI

struct CollectionView: View {
    
    var collectionList = CollectionList.share
    @State var newBagName = ""
    @Binding var isModalPresented: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    LazyVGrid(columns:
                                [GridItem(.flexible(), spacing: 20), GridItem(.flexible())],
                              spacing: 20,
                              content: {
                        NavigationLink(destination:
                                        NewStuffView(
                                            isModalPresented: $isModalPresented,
                                            collectionName: CollectionItem.emptyStuff.name,
                                            collectionItems: CollectionItem.emptyStuff.items
                                        )
                        ) {
                            CollectionCard(collection: CollectionItem.emptyStuff)
                        }
                    })
                    
                    Section(header: Text("From Collections")
                        .font(.title2)
                    ) {
                        LazyVGrid(columns:
                                    [GridItem(.flexible(), spacing: 20), GridItem(.flexible())],
                                  spacing: 20,
                                  content: {
                            ForEach (collectionList.collections) { collection in
                                NavigationLink(destination:
                                                NewStuffView(
                                                    isModalPresented: $isModalPresented,
                                                    collectionName: collection.name,
                                                    collectionItems: collection.items)
                                ) {
                                    CollectionCard(collection: collection)
                                }
                            }
                        })
                    }
                }
            }
            
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        isModalPresented = false
                    }
                    .foregroundStyle(Color(.red))
                }
            }
            .navigationTitle("Create a new bag")
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(isModalPresented: .constant(false))
    }
}
