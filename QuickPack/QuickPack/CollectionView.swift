import SwiftUI

struct CollectionView: View {
    
    var collectionList = CollectionList.share
    @State var newBagName = ""
    @Binding var isModalPresented: Bool
    
    var body: some View {
        
        NavigationView {
            List {
                LazyVGrid(columns:
                            [GridItem(.flexible(), spacing: 20, alignment: .center),
                             GridItem(.flexible(), spacing: 20, alignment: .center)],
                          spacing: 20,
                          content: {
                    CollectionCard(collection: CollectionItem(name: "FROM SCRATCH", imageName: "emptylist", items: [String]()), isModalPresented: $isModalPresented);
                })
                
                Section(header: Text("From Collections").font(.headline)) {
                    LazyVGrid(columns:
                                [GridItem(.flexible(), spacing: 20, alignment: .center),
                                 GridItem(.flexible(), spacing: 20, alignment: .center)],
                              spacing: 20,
                              content: {
                        ForEach (collectionList.collections) { collection in
                            CollectionCard(collection: collection, isModalPresented: $isModalPresented)
                            
                        }
                    }
                )}
            }
            .navigationTitle("Collect New Bag")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        isModalPresented = false
                    }
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(isModalPresented: .constant(false)
        )}
}
