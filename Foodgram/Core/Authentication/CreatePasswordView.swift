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
        VStack(spacing: 25) {
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
            Text("Yout password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            SecureField("Password", text: $password)
                .modifier(FGTextFieldModifier())
                .autocapitalization(.none)
            NavigationLink {
                CompleteSignUpView()
            } label: {
                Text("Sign Up")
                    .modifier(FGTextButtonModifier())
            }
            Spacer()
        }
        .padding([.horizontal, .top])
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
