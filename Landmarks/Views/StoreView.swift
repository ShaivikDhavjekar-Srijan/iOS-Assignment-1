//
//  StoreView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 18/09/22.
//

import SwiftUI

struct StoreView: View {
    //@StateObject used for creating class the first time
    @StateObject var model = StoreViewModel()
//    @ObservedObject private var settings = UserSettings()
    
    @State var isList: Bool = false
    
    var columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
                
        
        NavigationView {
            ZStack{
                if isList {
                    List(model.storeData, id: \.id) { product in
                        HStack(alignment: .top) {
                            AsyncImage(url: URL(string: product.image)) {
                                image in image.resizable()
                            } placeholder: {
                            ProgressView()
            
                            }
                            .frame(width:104, height: 150)
                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.headline)
                                Text("$\(product.price)")
                            }
                        }
                    }
                    
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(model.storeData, id: \.id) {product in ProductCard(product: product)
                            }
                        }
                        .padding()
                    }
                }
            }
            .task {
                await model.loadProductData()
            }
            .navigationTitle("FakeStore")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)
                {
//                    Button("Log Out") {
//                        UserDefaults.standard.set(false,forKey: "LOG_IN_KEY")
//                    }
//                    .foregroundColor(.red)
                    Button {
                        isList.toggle()
                    } label: {
                        Text("ViewStyle")
                    }
                }
            }
            
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
