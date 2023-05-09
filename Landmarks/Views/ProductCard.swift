//
//  ProductCard.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import SwiftUI

struct ProductCard: View {
    var product: StoreElement
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
            AsyncImage(url: URL(string: product.image)) {
                image in image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 178.2178, height: 247.5248)
            
            VStack(alignment: .leading) {
                Text(product.title).bold()
                Text("$"+(String(format:"%.02f", product.price)))
                    .font(.caption)
            }
            .foregroundColor(.black)
            .padding()
            .frame(width: 180, height:50 ,alignment: .leading)
            .background(.ultraThinMaterial)
        }
        .frame(width:180, height: 250)
        .border(.black.opacity(0.1), width: 1)
    }
}

//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: model.storeData[0])
//    }
//}
