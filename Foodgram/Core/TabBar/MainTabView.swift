//
//  MainTabView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-14.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            RecipesView().tabItem() {
                Text("Recipes")
                Image(systemName: "list.bullet")
            }
            FavouritesView().tabItem() {
                Text("Favourites")
                Image(systemName: "star.fill")
            }
            SettingsView().tabItem() {
                Text("Settings")
                Image(systemName: "gear")
            }
            LoginView().tabItem() {
                Text("Log In")
                Image(systemName: "key")
            }
        }
    }
}

struct CustomTabIcon: View {
    let image: String
    let title: String
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            Image(systemName: isFocused ? "\(image).fill" : image)
                .font(.system(size: 24))
            Text(title)
                .font(.caption)
        }
        .foregroundColor(isFocused ? .accentColor : .gray)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
