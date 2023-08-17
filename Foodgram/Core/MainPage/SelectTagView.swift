//
//  SelectTagView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 13.08.2023.
//

import SwiftUI

struct SelectTagView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel = TagsViewModel()
    @State var searchText = ""
    var recipeViewModel: RecipesViewModel
    
    var body: some View {
        NavigationStack {
            if (viewModel.state == .loading) {
                Text("Loading...")
            }
            List {
                ForEach(viewModel.getFilteredTags(query: searchText)) { tag in
                    Button {
                        guard !recipeViewModel.selectedTags.contains(tag) else {
                            recipeViewModel.selectedTags = recipeViewModel.selectedTags.filter { $0.slug != tag.slug }
                            return
                        }
                        recipeViewModel.selectedTags.append(tag)
                    } label: {
                        Label(
                            title: { Text(tag.name) },
                            icon: {
                                if recipeViewModel.selectedTags.contains(tag) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color(hex: tag.color))
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.white)
                                }
                            }
                        )
                        .foregroundColor(.black)
                    }
                }
                
            }
            .searchable(text: $searchText, prompt: "Search")
            .navigationTitle("Select tag")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            }
            
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct SelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipesViewModel()
        SelectTagView(recipeViewModel: viewModel)
    }
}
