//
//  ContentView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    let username: String
    var columns = [GridItem(.adaptive(minimum: 160, maximum: 20))]
    let data = ProductDataLoader().productData
    //print(data)
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    
                }.padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(username: "_shaivik123")
    }
}
