//
//  userDataLoader.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import Foundation

class LogInViewModel: ObservableObject {
    @Published var userData = [UserData]()
    //use $ to access publisher
    //if there is a change in variable, any view using publisher will be reinvoked with the updated value
    //when you call UserDataLoader you immediately load the data
    
    @Published private(set) var wrongUserName: Int = 0
    @Published private(set) var wrongPassword: Int = 0
    
    init() {
        loadUserData()
    }
    
    func loadUserData() {
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
    
    func authenticateUser(username: String, password: String) {
        if username == userData[0].username {
            wrongUserName = 0
            if password == userData[0].password {
                wrongPassword = 0
                UserDefaults.standard.set(true,forKey: "LOG_IN_KEY")
            } else {
                wrongPassword = 3
            }
        } else {
            wrongUserName = 3
        }
    }
}
