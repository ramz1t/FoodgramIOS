//
//  SelectTagView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 13.08.2023.
//

import SwiftUI

struct SelectTagView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = TagsViewModel()
    @State var searchText = ""
    @Binding var selectedTags: [Tag]
    
    var body: some View {
        NavigationStack {
            if (viewModel.state == .loading) {
                Text("Loading...")
            }
            List {
                ForEach(viewModel.getFilteredTags(query: searchText)) { tag in
                    Button {
                        guard !selectedTags.contains(tag) else {
                            selectedTags = selectedTags.filter { $0.slug != tag.slug }
                            return
                        }
                        selectedTags.append(tag)
                    } label: {
                        Label(
                            title: { Text(tag.name) },
                            icon: {
                                if selectedTags.contains(tag) {
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
        let selectedTags: [Tag] = Tag.MOCK
        SelectTagView(selectedTags: .constant(selectedTags))
    }
}
