//
//  UserDefaultsWrapper.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 06/10/22.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefaultsWrapper<T> {
    let key:String
    let defaultValue:T
    
    init(_ key:String, deafultValue:T){
        self.key = key
        self.defaultValue = deafultValue
    }
    var wrappedValue:T{
        get{
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set{
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
