//
//  productData.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import Foundation

struct ProductData: Codable {
    var name : String
    var image : String
    var price : Int
}

let productList = ProductDataLoader().productData
//print(productList)
