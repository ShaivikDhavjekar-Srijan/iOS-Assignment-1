//
//  productDataLoader.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 19/09/22.
//

import Foundation

public class ProductDataLoader: ObservableObject {
    @Published var storeData = [StoreElement]()
    
    //    init() {}
    
    func loadData() async {
        guard let storeUrl = URL(string: "https://fakestoreapi.com/products") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: storeUrl)
            print("Data Fetched")
            
            if let decodedResponse = try? JSONDecoder().decode([StoreElement].self, from: data) {
                storeData = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
    
    func sort() {
        self.storeData = self.storeData.sorted(by: {$0.id < $1.id})
    }
}
