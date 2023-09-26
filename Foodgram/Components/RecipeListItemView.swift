//
//  RecipeListItemView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-11.
//

import SwiftUI

struct RecipeListItemView: View {
    
    var recipe: Recipe
    let imageHeight = 60.0
    
    var body: some View {
        NavigationLink {
            RecipeDetailsView(recipe: recipe)
        } label: {
            HStack {
                AsyncImage(apiUrl: recipe.image) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(.gray)
                            .cornerRadius(10)
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (imageHeight / 3 * 4), height: imageHeight)
                            .cornerRadius(10)
                        
                    case .failure(_):
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.red)
                        
                    @unknown default:
                        Rectangle()
                            .fill(.gray)
                            .frame(width: (70 / 4 * 3), height: 70)
                    }
                }
                .frame(width: (imageHeight / 3 * 4), height: imageHeight)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(recipe.name)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    HStack(spacing: 3) {
                        Image(systemName: "clock")
                            .renderingMode(.template)
                            .foregroundColor(.secondary)
                            .font(.caption)
                        
                        Text("\(recipe.cookingTime) mins")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
                .padding(.leading, 5)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        .foregroundColor(.primary)
        .contextMenu {
            RecipeListItemContextMenu(recipe: recipe)
        } preview: {
            RecipeListItemPreview(recipe: recipe)
        }
    }
}

struct RecipeListItemPreview: View {
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(recipe.name)
                .fontWeight(.semibold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
            Label("\(recipe.author.firstName) \(recipe.author.lastName)", systemImage: "person")
                .font(.footnote)
                .fontWeight(.semibold)
            HStack {
                ForEach(recipe.tags) { tag in
                    RecipeTagView(tag: tag)
                }
            }
        }
        .padding()
    }
}

struct RecipeListItemContextMenu: View {
    @State var recipe: Recipe
    
    var body: some View {
        Button {
            recipe.isInShoppingCart.toggle()
        } label: {
            Label("Add to cart", systemImage: "cart")
        }
        Button {
            recipe.isFavorited.toggle()
        } label: {
            Label(recipe.isFavorited ? "Remove from favourites" : "Add to favourites", systemImage: recipe.isFavorited ? "star.fill" : "star")
        }
        NavigationLink {
            Text(recipe.author.firstName)
        } label: {
            Label("Go to author", systemImage: "person")
        }
        Button(role: .destructive) {
            RecipesViewModel().deleteRecipe(recipeId: recipe.id)
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
}

struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        //        RecipeListItemView(recipe: Recipe.MOCK)
        RecipeListItemPreview(recipe: Recipe.MOCK)
    }
}
