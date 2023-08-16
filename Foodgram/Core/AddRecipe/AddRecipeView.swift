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
    @State private var time = 5
    @State private var description = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = AddRecipeViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New recipe")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("upload")
                } label: {
                    Text("Create")
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 10)
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Name:")
                    TextField("Name", text: $name)
                        .modifier(FGTextFieldModifier())
                    
                    Text("Description:")
                    TextField("Description", text: $description, axis: .vertical)
                        .modifier(FGTextFieldModifier())
                    
                    Stepper("Cooking time: \(time) min.", value: $time, in: 1...1000)
                    
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        if viewModel.selectedImage != nil {
                            Text("Change image")
                        } else {
                            Text("Select image")
                        }
                    }
                    
                    if let image = viewModel.recipeImage {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Spacer()
                }
            }
            
        }
        .padding([.horizontal, .top])
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
