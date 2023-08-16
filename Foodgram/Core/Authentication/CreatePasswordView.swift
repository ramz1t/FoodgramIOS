//
//  CreatePasswordView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-14.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Yout password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            SecureField("Password", text: $password)
                .modifier(FGTextFieldModifier())
                .autocapitalization(.none)
                .padding()
            NavigationLink {
                CompleteSignUpView()
            } label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .frame(width: 360, height: 44)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
