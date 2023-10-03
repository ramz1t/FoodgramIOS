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

            Section("iOS App Stack") {
                StackListRowView(name: "Swift", color: "#f05138")
                StackListRowView(name: "SwiftUI", color: "#f05138")
            }
            
            Section("Web App Stack") {
                StackListRowView(name: "JS", color: "#f7df1e")
                StackListRowView(name: "React", color: "#61dafb")
            }
            
            Section("Server Stack") {
                StackListRowView(name: "Python", color: "#ffd43b")
                StackListRowView(name: "Django", color: "#000000")
                StackListRowView(name: "Docker", color: "#00acd3")
                StackListRowView(name: "Nginx", color: "#009900")
                StackListRowView(name: "Postgresql", color: "#336791")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StackListRowView: View {
    let name: String

    let color: String
    
    var body: some View {
        Text(name)
                    .foregroundStyle(Color.init(hex: color))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
            
    }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutAppView()
        }
    }
}

