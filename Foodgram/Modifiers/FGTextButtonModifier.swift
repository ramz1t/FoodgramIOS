//
//  TGTextButtonModifier.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 10.09.2023.
//

import SwiftUI

struct FGTextButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}
