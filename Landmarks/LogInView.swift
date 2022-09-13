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

//public class UserDataLoader {
//    @Published var userData = UserData()
//
//
//}

struct LogInView: View {
    
    @State private var userName = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var wrongPassword = 0
    
    @State private var loggedIn = false
    @State private var showingAlert = false
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            RoundedRectangle(cornerRadius: 100).scale(0.9).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 100).stroke().scale(0.899).foregroundColor(.black)
            VStack{
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Username", text:$userName)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .background(Color.black.opacity(0.05))
                    .border(.red, width: CGFloat(wrongUserName))
                
                SecureField("Password", text:$password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .background(Color.black.opacity(0.05))
                    .border(.red, width: CGFloat(wrongPassword))
                
                Button("Log In") {
                    authenticateUser(username: userName, password: password)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(.green)
                .cornerRadius(100)
                .padding()
                .alert(isPresented: $showingAlert) { //$ turns it into a binding boolean
                    Alert(title: Text("You have logged in as "+userName), dismissButton: .default(Text("OK")) {
                        withAnimation {
                            loggedIn = true
                        }
                    })
                    
                }
            }
            
            if loggedIn {
                ContentView(username: userName)
            }
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username == "_shaivik123" {
            wrongUserName = 0
            if password == "shv1020" {
                let productList = ProductDataLoader().productData
                print(productList)
                wrongPassword = 0
                showingAlert = true
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
    }
}
