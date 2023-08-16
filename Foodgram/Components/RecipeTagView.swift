//
//  RecipeTagView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 08.08.2023.
//

import SwiftUI

struct RecipeTagView: View {
    let tag: Tag
    
    var body: some View {
        Text(tag.name)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(hex: tag.color))
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .fontWeight(.bold)
            .font(.footnote)
        
    }
}

struct RecipeTagView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTagView(tag: Tag.MOCK.first!)
    }
}
