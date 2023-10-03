//
//  FavouritesView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-11.
//

import SwiftUI

enum Favourites: String, Equatable, CaseIterable {
    case recipes = "Recipes"
    case users = "Users"
}

struct FavouritesView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: UIControl.State.selected)
    }
    
    @State private var searchText = ""
    var viewModel = RecipesViewModel()
    @State private var selectedOption: Favourites = .recipes
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Select favourites option", selection: $selectedOption) {
                        ForEach(Favourites.allCases, id: \.self) { Text($0.rawValue) }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                if selectedOption == .recipes {
                    ForEach(viewModel.recipes, id: \.id) { recipe in
                        FavouriteRecipeListView(recipe: recipe)
                    }
                } else {
                    ForEach(1..<20) { _ in
                        NavigationLink {
                            UserView(user: User.MOCK)
                        } label: {
                            UserListItemView(user: User.MOCK)
                        }
                    }
                }
                
            }
            .listStyle(.inset)
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

struct UserListItemView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("\(user.firstName) \(user.lastName)")
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                Text("• Mashed potatos")
                Text("• Dumplings")
                Text("• Chicken wings")
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
        }
    }
}

struct FavouriteRecipeListView: View {
    let recipe: Recipe
    
    var body: some View {
        NavigationLink {
            RecipeDetailsView(recipe: recipe)
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Text(recipe.name)
                        .fontWeight(.semibold)
                    Text("• \(recipe.cookingTime) mins")
                        .foregroundStyle(.secondary)
                }
                RecipeTagsView(tags: recipe.tags)
            }
        }
        .contextMenu {
            RecipeListItemContextMenu(recipe: recipe)
        } preview: {
            RecipeListItemPreview(recipe: recipe)
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
