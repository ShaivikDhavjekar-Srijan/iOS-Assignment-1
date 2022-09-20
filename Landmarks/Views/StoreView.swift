//
//  StoreView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 18/09/22.
//

import SwiftUI

struct StoreView: View {
    //@StateObject used for creating class the first time
    @StateObject var storeResults = ProductDataLoader()
    @ObservedObject private var settings = UserSettings()
    
    var columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
        //        List(storeResults, id: \.id) { product in
        //            HStack(alignment: .top) {
        //                AsyncImage(url: URL(string: product.image)) {
        //                    image in image.resizable()
        //                } placeholder: {
        //                ProgressView()
        //
        //                }
        //                .frame(width:104, height: 150)
        //                VStack(alignment: .leading) {
        //                    Text(product.title)
        //                        .font(.headline)
        //                    Text("$\(product.price)")
        //                }
        //            }
        //        }
        //        .task {
        //            await loadData()
        //        }
        //        .navigationTitle("FakeStore")
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(storeResults.storeData, id: \.id) {product in ProductCard(product: product)
                }
            }
            .padding()
            .navigationTitle("FakeStore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing)
            //                {
            //                    Button("Log Out") {
            //                        UserDefaults.standard.set(false,forKey: "LOG_IN_KEY")
            //                    }
            //                    .foregroundColor(.red)
            //                }
            //            }
        }
        .task {
            await storeResults.loadData()
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
