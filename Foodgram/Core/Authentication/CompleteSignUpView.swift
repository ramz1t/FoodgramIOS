//
//  CompleteSignUpView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-14.
//

import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle")
                        .font(.system(size: 70))
                        .foregroundColor(.green)
            Text("Welcome to Foodgram!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Click below to complete registration and start creating recipes")
                .multilineTextAlignment(.center)
                .font(.footnote)
            Button {
                print("complete")
            } label: {
                Text("Complete Sign Up")
                    .modifier(FGTextButtonModifier())
            }

        }
        .padding(.horizontal)
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
