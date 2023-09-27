//
//  ChangePasswordView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 18.09.2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var oldPass = ""
    @State private var newPass = ""
    
    var body: some View {
        VStack {
            TextField("Old password", text: $oldPass)
                .modifier(FGTextFieldModifier())
            TextField("New password", text: $newPass)
                .modifier(FGTextFieldModifier())
            Spacer()
        }
        .navigationTitle("Change password")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            Button("Save") {
                
            }
            .fontWeight(.semibold)
        }
    }
}

#Preview {
    NavigationStack {
        ChangePasswordView()
            .navigationTitle("Change password")
    }
    
}
