//
//  AddRecipeViewModel.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-18.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class AddRecipeViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var recipeImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.recipeImage = Image(uiImage: uiImage)
    }
}
