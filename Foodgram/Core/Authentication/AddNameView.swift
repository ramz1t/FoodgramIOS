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
        VStack(spacing: 25) {
            Text("Add your name")
                .font(.title2)
                .fontWeight(.bold)
            Text("This name will be written in your recipes info")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            TextField("Name", text: $name)
                .modifier(FGTextFieldModifier())
                .autocapitalization(.none)
            NavigationLink {
                CreatePasswordView()
            } label: {
                Text("Next")
                    .modifier(FGTextButtonModifier())
            }
            Spacer()
        }
        .padding([.horizontal, .top])
    }
}

struct AddNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddNameView()
    }
}
