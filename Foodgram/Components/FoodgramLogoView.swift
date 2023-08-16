//
//  FoodgramLogoView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-19.
//

import SwiftUI

struct FoodgramLogoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "fork.knife")
                .font(.system(size: 80))
                .foregroundColor(.accentColor)
            Text("Foodgram")
                .fontDesign(.rounded)
                .font(.system(size: 30))
                .fontWeight(.black)
                .foregroundColor(.accentColor)
        }
    }
}

struct FoodgramLogoView_Previews: PreviewProvider {
    static var previews: some View {
        FoodgramLogoView()
    }
}
