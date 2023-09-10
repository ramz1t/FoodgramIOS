//
//  SettingsView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-19.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedTheme: String = "light"
    var body: some View {
        NavigationView {
            List {
                Section("Profile") {
                    NavigationLink {
                        Text("Change password")
                    } label: {
                        Label("Change password", systemImage: "key")
                    }
                    Button {
                        print("logout")
                    } label: {
                        Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.accentColor)
                    }
                }
                Section("App") {
                    Picker(selection: $selectedTheme) {
                        Label("Light", systemImage: "sun.max")
                            .tag("light")
                        Label("Dark", systemImage: "moon")
                            .tag("dark")
                        Label("Auto", systemImage: "a.circle")
                            .tag("auto")
                    } label: {
                        Label("Select theme", systemImage: "paintpalette")
                    }
                    NavigationLink {
                        AboutAppView()
                    } label: {
                        Label("About", systemImage: "info.circle")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
