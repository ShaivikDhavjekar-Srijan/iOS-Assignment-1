//
//  SplashScreenView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 12/09/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    @StateObject private var settings = UserSettings()
    
    //@State is used to modify values inside a struct which is not usually allowed
    //State variables are stored in shared storage managed by SwiftUI
    //SwiftUI can recreate and destroy the structs without losing the state
    //RECOMMENDED TO BE PRIVATE
    @State private var isActive = false
    @State private var opacity = 0.0
    
    var body: some View {
        if isActive {
            if settings.isLoggedIn {
                StoreView()
            } else {
                LogInView()
            }
        } else {
            ZStack {
                Color.green.ignoresSafeArea()
                VStack {
                    Image("Landmarks-Logo-Splash-Screen")
                        .resizable()
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                self.opacity = 1.0
                            }
                        }
                }.frame(width: 400, height: 400)
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
