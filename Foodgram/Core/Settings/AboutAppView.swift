//
//  AboutAppView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-19.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        Form {
            Section {
                FoodgramLogoView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            Section("Authors") {
                Text("Timur Ramazanov")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                Text("Alex Zawadsky")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
            }
            Section {
                Link("iOS App repository", destination: URL(string: "https://github.com/ramz1t/FoodgramIOS")!)
                Link("Web App and Server repository", destination: URL(string: "https://github.com/alexzawadsky/FoodGram")!)
            } header: {
                Text("Links")
            } footer: {
                Text("If you found any bugs, please open an Issue on github")
            }
            Section("Version") {
                Text("1.0.0")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollDisabled(true)
    }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutAppView()
        }
    }
}

