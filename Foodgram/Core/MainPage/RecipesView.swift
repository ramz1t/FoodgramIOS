//
//  RecipiesView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-11.
//

import SwiftUI

struct RecipesView: View {
    
    @State private var addRecipeViewIsOpen = false
    @State private var categoryPickerViewIsOpen = false
    @State private var cartViewIsOpen = false
    @StateObject var viewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeListItemView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        cartViewIsOpen.toggle()
                    } label : {
                        Label("Cart", systemImage: "cart")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        categoryPickerViewIsOpen.toggle()
                    } label: {
                        Label(
                            title: { Text("Filter") },
                            icon: {
                                if viewModel.selectedTags != [] {
                                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                } else {
                                    Image(systemName: "line.3.horizontal.decrease.circle")
                                }
                            }
                        )
                    }
                    Button {
                        addRecipeViewIsOpen.toggle()
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $addRecipeViewIsOpen) {
                AddRecipeView()
            }
            .sheet(isPresented: $categoryPickerViewIsOpen) {
                SelectTagView(selectedTags: $viewModel.selectedTags)
                    .presentationDetents([.large, .medium])
                    .presentationDragIndicator(.hidden)
            }
            .onChange(of: viewModel.selectedTags) { newTag in
                viewModel.fetch()
            }
            .fullScreenCover(isPresented: $cartViewIsOpen) {
                Text("cart")
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}


struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
