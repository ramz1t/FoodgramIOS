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
            VStack {
                VStack(spacing: 25) {
                    Spacer()
                    
                    FoodgramLogoView()
                    
                    VStack {
                        TextField("Enter your email", text: $email)
                            .modifier(FGTextFieldModifier())
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        SecureField("Enter your password", text: $password)
                            .modifier(FGTextFieldModifier())
                    }
                    
                    Button {
                        print("login")
                    } label: {
                        Text("Log In")
                            .modifier(FGTextButtonModifier())
                    }
                    
                    HStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 0.5)
                        Text("OR")
                            .font(.footnote)
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 0.5)
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
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .signInWithAppleButtonStyle(.whiteOutline)
                    Spacer()
                }
                .padding(.horizontal)
                VStack(spacing: 25) {
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
