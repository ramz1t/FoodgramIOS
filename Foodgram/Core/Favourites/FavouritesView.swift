//
//  FavouritesView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-11.
//

import SwiftUI

struct FavouritesView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: UIControl.State.selected)
    }
    
    @State private var searchText = ""
    var viewModel = RecipesViewModel()
    @State private var selectedOption = 0
    
    private func getFilteredResults() -> [Recipe] {
        if searchText == "" {
            return viewModel.recipes
        }
        let filteredResults = viewModel.recipes.filter { $0.name.contains(searchText) }
        return filteredResults
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Picker("select", selection: $selectedOption) {
                    Text("Recipes")
                        .tag(0)
                    Text("Users")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                LazyVStack {
                    ForEach(getFilteredResults(), id: \.id) { recipe in
                        RecipeListItemView(recipe: recipe)
                    }
                }
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search")
            .navigationTitle("Favourites")
            .onAppear {
                viewModel.fetch()
            }
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
