//
//  productDataLoader.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import Foundation

public class ProductDataLoader {
    @Published var productData = [ProductData]()
    //use $ to access publisher
    //if there is a change in variable, any view using publisher will be reinvoked with the updated value
    //when you call ProductDataLoader you immediately load the data
    init() {
        load()
        sort()
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
                //get data from json file using jsonDecoder
                //decoding array of ProductData
                let dataFromJson = try JSONDecoder().decode([ProductData].self, from: data)
                self.productData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
    func sort() {
        self.productData = self.productData.sorted(by: {$0.price < $1.price})
    }
}
