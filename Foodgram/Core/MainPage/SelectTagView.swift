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
    var recipesViewModel: RecipesViewModel
    @State var searchText = ""
    
    func toggleSelection(tag: Tag) -> Void {
        if recipesViewModel.selectedTags.contains(tag) {
            recipesViewModel.selectedTags = recipesViewModel.selectedTags.filter { $0 != tag }
        } else {
            recipesViewModel.selectedTags.append(tag)
        }
        recipesViewModel.fetch()
    }
    
    var body: some View {
        NavigationStack {
            List(tagsViewModel.getFilteredTags(query: searchText)) { tag in
                Button {
                    toggleSelection(tag: tag)
                } label: {
                    Label {
                        Text(tag.name)
                    } icon: {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(hex: tag.color))
                            .if(!recipesViewModel.selectedTags.contains(tag)) { view in
                                view.opacity(0)
                            }
                    }
                }
                .foregroundStyle(.primary)
            }
            .searchable(text: $searchText, prompt: "Search")
            .navigationTitle("Select tag")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                }
                
            }
            .onAppear {
                tagsViewModel.fetch()
            }
        }
    }
}


struct SelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        let recipesViewModel = RecipesViewModel()
        SelectTagView(recipesViewModel: recipesViewModel)
    }
}
