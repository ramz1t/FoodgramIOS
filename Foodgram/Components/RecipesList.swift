//
//  RecipesList.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 02.10.2023.
//

import SwiftUI

struct RecipesList: View {
    var recipesViewModel: RecipesViewModel
    var body: some View {
        List(recipesViewModel.recipes) {
            RecipeListItemView(recipe: $0)
        }
        .listStyle(.inset)
        .refreshable {
            recipesViewModel.fetch()
        }
        .onAppear {
            recipesViewModel.fetch()
        }
    }
}

#Preview {
    NavigationView {
        let viewModel = RecipesViewModel()
        RecipesList(recipesViewModel: viewModel)
    }
}
