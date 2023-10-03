//
//  ProfileView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 02.10.2023.
//

import SwiftUI

struct UserView: View {
    let user: User
    let recipesViewModel = RecipesViewModel()
    
    var body: some View {
        RecipesList(recipesViewModel: recipesViewModel)
        .navigationTitle("\(user.firstName) \(user.lastName)")
        .toolbar {
            Button {
                
            } label: {
                Label("Add to favourites", systemImage: "person.crop.circle.badge.checkmark")
            }
        }
    }
}

#Preview {
    NavigationView {
        UserView(user: User.MOCK)
    }
}
