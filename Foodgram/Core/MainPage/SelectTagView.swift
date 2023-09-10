//
//  SelectTagView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 13.08.2023.
//

import SwiftUI

struct SelectTagView: View {
    @Environment(\.dismiss) var dismiss
    var tagsViewModel = TagsViewModel()
    @State var searchText = ""
    var recipeViewModel: RecipesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tagsViewModel.getFilteredTags(query: searchText)) { tag in
                    Button {
                        guard !recipeViewModel.selectedTags.contains(tag) else {
                            recipeViewModel.selectedTags = recipeViewModel.selectedTags.filter { $0 != tag }
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
                                    Image(systemName: "checkmark")
                                        .opacity(0)
                                        
                                }
                            }
                        )
                        .foregroundColor(.primary)
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
            tagsViewModel.fetch()
        }
    }
}

struct SelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipesViewModel()
        SelectTagView(recipeViewModel: viewModel)
    }
}
