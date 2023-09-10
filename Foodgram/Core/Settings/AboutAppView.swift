//
//  AboutAppView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-19.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        VStack(spacing: 24) {
            FoodgramLogoView()
            VStack {
                Text("Made by ") +
                Text("Timur Ramazanov")
                    .fontWeight(.semibold)
                + Text(" and ") +
                Text("Alex Zawadsky")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 24)
            .multilineTextAlignment(.center)
            Link("Github link", destination: URL(string: "https://github.com/ramz1t")!)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}

