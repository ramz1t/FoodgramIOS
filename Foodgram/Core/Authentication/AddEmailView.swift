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
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            TextField("Email", text: $email)
                .modifier(FGTextFieldModifier())
                .autocapitalization(.none)
                .padding()
            NavigationLink {
                AddNameView()
            } label: {
                Text("Next")
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
