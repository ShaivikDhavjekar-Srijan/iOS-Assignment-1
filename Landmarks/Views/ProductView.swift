//
//  ProductView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/10/22.
//

import SwiftUI
import UIKit

struct ProductView: View {
    
    var verticalPadding: CGFloat = 5
    var horizontalPadding: CGFloat = 5
    
    var product: StoreElement
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading){
                    AsyncImage(url: URL(string: product.image)) {
                        image in image.resizable()
                    } placeholder: {
                        ProgressView()
                            .frame(height: UIScreen.main.bounds.size.height*0.70)

                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width*0.9)
                    
                    Text(product.title)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                        .padding(.vertical,verticalPadding)
                    
                    HStack {
                        Text((String(format:"%.02f", product.rating.rate))+" ★")
                            .foregroundColor(.white)
                            .padding(.vertical,verticalPadding)
                            .padding(.horizontal,horizontalPadding)
                            .background(Color.green)
                        Text(String(product.rating.count) + " ratings")
                            .foregroundColor(.gray)
                    }
                    .font(.system(size: 15, weight: .regular))
                    
                    Text("$"+(String(format:"%.02f", product.price)))
                        .font(.system(size: 25, weight: .bold))
                        .padding(.vertical,verticalPadding)

                    Text(product.storeDescription)
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .light))
                        .padding(.top,5)
                        .padding(.bottom,10)
                    
                }
                .frame(width: UIScreen.main.bounds.size.width*0.9)
            }
            
            HStack(spacing: 0){
                Button{
                    
                } label: {
                    Text("ADD TO CART")
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.size.width*0.5, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                Button{
                    
                } label: {
                    Text("BUY NOW")
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.size.width*0.5, height: 50)
                        .foregroundColor(.white)
                        .background(Color.orange)
                }
            }
        }.padding(.bottom, 1)
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView()
//    }
//}
