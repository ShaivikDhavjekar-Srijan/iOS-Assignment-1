//
//  ContentView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 12/09/22.
//

import SwiftUI

let productList = ProductDataLoader().productData

struct ContentView: View {
    var columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id:\.price) {
                        product in ProductCard(product: product)
                    }
                }.padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    }
}
