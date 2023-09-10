//
//  AddRecipeView.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-17.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    
    @State private var name = ""
    @State private var selectedHours = 0
    @State private var selectedMinutes = 5
    @State private var description = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = AddRecipeViewModel()
    var tagsViewModel = TagsViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("", text: $name)
                }
                
                Section {
                    TextField("", text: $description, axis: .vertical)
                } header: {
                    Text("Description")
                } footer: {
                    Text("Provide all information about cooking process. The more you tell - the easier it will be for others to cook your dish")
                }
                
                Section("Cooking time") {
                    HStack {
                        Picker("Hours", selection: $selectedHours) {
                            ForEach(0..<24, id: \.self) { hour in
                                Text("\(hour) h")
                            }
                        }
                        .pickerStyle(.wheel)
                        
                        
                        Picker("Minutes", selection: $selectedMinutes) {
                            if (selectedHours != 0) {
                                Text("0 min")
                            }
                            ForEach(1..<60, id: \.self) { minute in
                                Text("\(minute) min")
                            }
                        }
                        .pickerStyle(.wheel)
                        
                    }
                }
                Section("Image") {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        if viewModel.selectedImage != nil {
                            Text("Change")
                        } else {
                            Text("Select")
                        }
                    }
                    
                    if let image = viewModel.recipeImage {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                Section("Tags") {
                    ForEach(tagsViewModel.tags) { tag in
                        Label(tag.name, systemImage: "pen")
                            .foregroundStyle(Color.init(hex: tag.color))
                    }
                }
                
                Section("Ingridients") {
                    NavigationLink {
                        Text("Add ingridient view")
                    } label: {
                        Text("Add")
                            .foregroundStyle(.accent)
                    }
                    
                    Text("Carrots - 100g.")
                    Text("Potatos - 150g.")
                }
                
            }
            .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Create")
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add recipe")
            .onAppear {
                tagsViewModel.fetch()
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
