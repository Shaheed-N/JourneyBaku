//
//  SplashScreen.swift
//  BakuCafes
//
//  Created by Shahid on 15.04.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            Color("logocolor")
                .edgesIgnoringSafeArea(.all)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .opacity(isAnimated ? 1 : 0)
                .scaleEffect(isAnimated ? 2.2 : 0.5)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(), value: isAnimated)
         
        }
        .onAppear {
            withAnimation {
                isAnimated = true
            }
        }
    }
}

struct MainView: View {
    @State private var showSplashScreen = true
    
    var body: some View {
        if showSplashScreen {
            SplashScreenView()
                .transition(AnyTransition.opacity.combined(with: .scale))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            showSplashScreen = false
                        }
                    }
                }
        } else {
            MapView(cafes: cafes)
        }
    }
}




