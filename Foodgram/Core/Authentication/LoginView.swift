//
//  LoginView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-14.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()
                
                FoodgramLogoView()
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(FGTextFieldModifier())
                        .padding(.horizontal)
                    SecureField("Enter your password", text: $password)
                        .modifier(FGTextFieldModifier())
                        .padding(.horizontal)
                }
                
                Button {
                    print("login")
                } label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.subheadline)
                        .frame(width: 360, height: 44)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        print(authResults)
                    case .failure(let error):
                        print(error)
                    }
                }
                .frame(width: 280, height: 45)
                .signInWithAppleButtonStyle(.whiteOutline)
                
                
                Spacer()
                
                Divider()
                NavigationLink {
                    AddEmailView()
                } label: {
                    Text("Don't have an account? ")
                        .font(.caption)
                    + Text("Sign up")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                Divider()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
