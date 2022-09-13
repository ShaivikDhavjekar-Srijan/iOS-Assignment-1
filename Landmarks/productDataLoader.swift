//
//  productDataLoader.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import Foundation

public class ProductDataLoader {
    @Published var productData = [ProductData]()
    
    //when you call ProductDataLoader you immediatrly load the data
    init() {
        load()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "productData", withExtension:"json") {
            //do catch for errors
            do {
                //get data from productData.json
                //use 'try' whenever you have a 'throws'
                let data = try Data(contentsOf: fileLocation)
                //decoding json
                //JSONDecoder allows to decode instances of a dat type from json object
                let jsonDecoder = JSONDecoder()
                //get data from json file using jsonDecoder
                //decoding array of ProductData
                let dataFromJson = try jsonDecoder.decode([ProductData].self, from: data)
                self.productData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}
