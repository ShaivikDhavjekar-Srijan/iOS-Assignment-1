//
//  SplashScreenView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 12/09/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var opacity = 0.0
    
    var body: some View {
        if isActive {
            LogInView()
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
