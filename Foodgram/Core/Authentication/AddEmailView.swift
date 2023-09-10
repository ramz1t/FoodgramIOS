//
//  AddEmailView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-14.
//

import SwiftUI

struct AddEmailView: View {
    
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            TextField("Email", text: $email)
                .modifier(FGTextFieldModifier())
                .autocapitalization(.none)
            NavigationLink {
                AddNameView()
            } label: {
                Text("Next")
                    .modifier(FGTextButtonModifier())
            }
            Spacer()
        }
        .padding([.horizontal, .top])
    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
