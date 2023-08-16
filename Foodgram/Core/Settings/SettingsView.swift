//
//  SettingsView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-19.
//

import SwiftUI

struct SettingsView: View {
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
                Section("Other") {
                    NavigationLink {
                        AboutAppView()
                    } label: {
                        Label("About app", systemImage: "info.circle")
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
