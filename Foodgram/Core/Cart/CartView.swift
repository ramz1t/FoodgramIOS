//
//  CartView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 02.10.2023.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showIngridients = false
    
    var body: some View {
        NavigationView {
            List {
                if showIngridients {
                    Section("19 Ingridients") {
                        ForEach(1..<20) { _ in
                            HStack {
                                Text("Milk")
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                Spacer()
                                Text("500ml")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secondary)
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                } else {
                    Section("9 recipes") {
                        ForEach(1..<10) { _ in
                            NavigationLink {
                                RecipeDetailsView(recipe: Recipe.MOCK)
                            } label: {
                                Text("Mashed potatos")
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        showIngridients.toggle()
                    } label: {
                        Label("Ingridients list", systemImage: "list.number")
                    }
                    ShareLink(item: "Shopping list")
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Close") {
                        dismiss()
                    }
                    .bold()
                }
            }
        }
    }
}

#Preview {
    CartView()
}
