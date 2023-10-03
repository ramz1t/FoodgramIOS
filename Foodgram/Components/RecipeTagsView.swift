//
//  RecipeTagsView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 03.10.2023.
//

import SwiftUI

struct RecipeTagsView: View {
    let tags: [Tag]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(tags) { tag in
                RecipeTagView(tag: tag)
            }
        }
    }
}

#Preview {
    RecipeTagsView(tags: Recipe.MOCK.tags)
}
