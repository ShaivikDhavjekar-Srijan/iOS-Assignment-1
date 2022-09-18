//
//  productDataLoader.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import Foundation
//
//public class ProductDataLoader {
//    @Published var storeData = [StoreElement]()
//    //use $ to access publisher
//    //if there is a change in variable, any view using publisher will be reinvoked with the updated value
//    //when you call ProductDataLoader you immediately load the data
//    init() {}
//
//    func loadData() async {
//        guard let storeUrl = URL(string: "https://fakestoreapi.com/products") else {
//            print("Invalid URL")
//            return
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: storeUrl)
//            print("Data Fetched")
//
//            if let decodedResponse = try? JSONDecoder().decode([StoreElement].self, from: data) {
//                storeData = decodedResponse
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
//
//    func load() {
//        if let fileLocation = Bundle.main.url(forResource: "productData", withExtension:"json") {
//            //do catch for errors
//            do {
//                //get data from productData.json
//                //use 'try' whenever you have a 'throws'
//                let data = try Data(contentsOf: fileLocation)
//                //decoding json
//                //JSONDecoder allows to decode instances of a dat type from json object
//                //get data from json file using jsonDecoder
//                //decoding array of ProductData
//                let dataFromJson = try JSONDecoder().decode([ProductData].self, from: data)
//                self.productData = dataFromJson
//
//            } catch {
//                print(error)
//            }
//        }
//    }
//    
//    func sort() {
//        self.storeData = self.storeData.sorted(by: {$0.id < $1.id})
//    }
//}
