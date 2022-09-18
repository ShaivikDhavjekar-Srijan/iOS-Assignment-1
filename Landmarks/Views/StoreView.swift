//
//  StoreView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 18/09/22.
//

import SwiftUI

struct StoreView: View {
    @State private var storeResults = [StoreElement]()
//    @State private var storeResults = ProductDataLoader().storeData
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
                ForEach(storeResults, id: \.id) {
                    product in ProductCard(product: product)
                }
            }
            .padding()
            .navigationTitle("FakeStore")
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let storeUrl = URL(string: "https://fakestoreapi.com/products") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: storeUrl)
            print("Data Fetched")
            
            if let decodedResponse = try? JSONDecoder().decode([StoreElement].self, from: data) {
                storeResults = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
