//
//  AddNameView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-15.
//

import SwiftUI

struct AddNameView: View {
    
    @State private var name = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your name")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("This name will be written in your recipes info")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            TextField("Name", text: $name)
                .modifier(FGTextFieldModifier())
                .autocapitalization(.none)
                .padding()
            NavigationLink {
                CreatePasswordView()
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

struct AddNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddNameView()
    }
}
