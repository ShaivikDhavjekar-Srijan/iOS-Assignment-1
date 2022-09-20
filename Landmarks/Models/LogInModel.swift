//
//  userData.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 19/09/22.
//

import Foundation

struct UserData: Codable {
    var username: String
    var password: String
}

final class UserSettings: ObservableObject {
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "LOG_IN_KEY")
}
