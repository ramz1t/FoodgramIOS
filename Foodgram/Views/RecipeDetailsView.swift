//
//  RecipeDetailsView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-11.
//

import SwiftUI

struct RecipeDetailsView: View {
    @State var recipe: Recipe
    @State var flag = Tag.MOCK.first!
    @State private var deleteAlertIsShown = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                recipeImage
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack(spacing: 10) {
                    ForEach(recipe.tags) { tag in
                        RecipeTagView(tag: tag)
                    }
                }
                Divider()
                    .padding(.vertical, 10)
                VStack(alignment: .leading, spacing: 5) {
                    Label("\(recipe.cookingTime) mins", systemImage: "clock")
                    Label("\(recipe.author.firstName) \(recipe.author.lastName)", systemImage: "person")
                }
                .font(.footnote)
                .fontWeight(.semibold)
                Divider()
                    .padding(.vertical, 10)
                Text(recipe.text)
                    .multilineTextAlignment(.leading)
                Divider()
                    .padding(.vertical, 10)
                ingridientsList
                Divider()
                    .padding(.top, 12)
            }
            .padding([.bottom, .horizontal])
            .frame(maxWidth: 500)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    recipe.isInShoppingCart.toggle()
                } label: {
                    Label("Add to cart", systemImage: recipe.isInShoppingCart ? "cart.badge.minus" : "cart.badge.plus")
                }
                Button {
                    recipe.isFavorited.toggle()
                } label: {
                    Label("Add to favourites", systemImage: recipe.isFavorited ? "star.fill" : "star")
                }
                .tint(.yellow)
                .animation(.default, value: recipe.isFavorited)
                moreActionsMenu
            }
        }
    }
    
    var recipeImage: some View {
        AsyncImage(apiUrl: recipe.image) { phase in
            switch phase {
            case .empty:
                Color.gray
                    .cornerRadius(10)
                    .frame(minHeight: 250)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            case .failure(_):
                HStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle")
                        .imageScale(.small)
                        .frame(minHeight: 250)
                        .foregroundColor(.red)
                        .font(.title)
                    Spacer()
                }
            @unknown default:
                Rectangle()
                    .fill(.gray)
                    .frame(minHeight: 250)
            }
        }
    }
    
    @ViewBuilder var moreActionsMenu: some View {
        if true {
            Menu {
                Group {
                    Button {
                        
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    Button(role: .destructive) {
                        deleteAlertIsShown = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            } label: {
                Label("More", systemImage: "ellipsis.circle")
            }
            .alert("Delete repipe", isPresented: $deleteAlertIsShown) {
                Button("Delete", role: .destructive) {
                    RecipesViewModel().deleteRecipe(recipe)
                    dismiss()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This action is not reversible")
            }
        }
    }
    
    var ingridientsList: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(24)),
            GridItem(.flexible())
        ], alignment: .leading, spacing: 16) {
            ForEach(Array(recipe.ingredients.enumerated()), id: \.element) { index, ingredient in
                Text("\(index + 1)")
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                HStack {
                    Text(ingredient.name)
                    Spacer()
                    Text("\(ingredient.amount) \(ingredient.measurementUnit)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                }
                
            }
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipeDetailsView(recipe: Recipe.MOCK)
        }
    }
}
