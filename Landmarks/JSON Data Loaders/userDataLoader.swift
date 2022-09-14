//
//  userDataLoader.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import Foundation

public class UserDataLoader {
    @Published var userData = [UserData]()
    
    //when you call UserDataLoader you immediately load the data
    init() {
        load()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "loginData", withExtension:"json") {
            //do catch for errors
            do {
                //get data from loginData.json
                //use 'try' whenever you have a 'throws'
                let data = try Data(contentsOf: fileLocation)
                //decoding json
                //JSONDecoder allows to decode instances of a dat type from json object
                let jsonDecoder = JSONDecoder()
                //get data from json file using jsonDecoder
                //decoding array of UserData
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                self.userData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}
