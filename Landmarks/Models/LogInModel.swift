//
//  userData.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 19/09/22.
//

import Foundation
import Combine

struct UserData: Codable {
    var username: String
    var password: String
}

final class UserSettings: ObservableObject {
    let trigger = PassthroughSubject<Void, Never>()
    
    @UserDefaultsWrapper("LOG_IN_KEY",deafultValue:false)
    var isLoggedIn:Bool{
        willSet{
            trigger.send()
        }
    }
}
