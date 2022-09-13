//
//  ProductCard.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import SwiftUI

struct ProductCard: View {
    var product: ProductData
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(product.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 180)
                .scaledToFit()

            VStack(alignment: .leading) {
                Text(product.name).bold()

                Text("₹\(product.price)")
                    .font(.caption)
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            .background(.white.opacity(0.55))
            .cornerRadius(20)
        }
        .frame(width:180, height: 250)
        .shadow(radius:3)

    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
    }
}
