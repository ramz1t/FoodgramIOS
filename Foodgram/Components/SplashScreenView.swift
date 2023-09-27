//
//  SplashScreenView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-19.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.7
    @State private var opacity = 0.3
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                FoodgramLogoView()
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                    withAnimation {
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
