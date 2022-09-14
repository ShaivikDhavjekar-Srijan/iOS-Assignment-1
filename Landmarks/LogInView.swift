//
//  LogInView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import SwiftUI

struct UserData: Codable {
    var username: String
    var password: String
}

let loginData = UserDataLoader().userData

struct LogInView: View {
    
    @State private var userName = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var wrongPassword = 0
    @State private var loggedIn = false
        
    var body: some View {
        NavigationView {
            ZStack{

                Color.green.ignoresSafeArea()
                VStack{
                    Text("Log In")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    TextField("Username", text:$userName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .background(Color.black.opacity(0.1))
                        .border(.red, width: CGFloat(wrongUserName))
                    
                    SecureField("Password", text:$password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .background(Color.black.opacity(0.1))
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Log In") {
                        authenticateUser(username: userName, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.green)
                    .cornerRadius(100)
                    .padding()

                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $loggedIn) {
                    }
                    
                }
                .frame(width: 360, height: 700)
                .background(.white)
                .cornerRadius(100)

                

            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username == loginData[0].username {
            wrongUserName = 0
            if password == loginData[0].password {
                wrongPassword = 0
                loggedIn = true

            } else {
                wrongPassword = 3
            }
        } else {
            wrongUserName = 3
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .previewInterfaceOrientation(.portrait)
    }
}
