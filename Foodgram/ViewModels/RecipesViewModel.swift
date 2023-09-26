//
//  RecipesViewModel.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 07.08.2023.
//

import Foundation
import Observation
import SwiftUI

struct RecipeResponseWrapper: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Recipe]
}

@Observable class RecipesViewModel {
    var recipes = [Recipe]()
    var state: FetcherState = .good
    var selectedTags = [Tag]()
    var queryString = ""
    
    func fetch() {
        state = .loading
        DataLoader.request(.recipes(matching: queryString, tags: selectedTags)) { result in
            switch result {
            case .success(let data):
                do {
                    let responseWrapper = try JSONDecoder().decode(RecipeResponseWrapper.self, from: data)
                    let recipes = responseWrapper.results
                    
                    DispatchQueue.main.async {
                        self.recipes = recipes
                        self.state = .good
                    }
                } catch {
                    self.state = .error("error")
                }
            case .failure:
                self.state = .error("error")
            }
        }
    }
    
    func deleteRecipe(recipeId: Int) {
        print("recipe \(recipeId) is deleted")
    }
    
    func arrayToQueryString(_ array: [Tag]) -> String {
        var components: [String] = []
        
        for tag in array {
            if let encodedName = tag.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                components.append("tags=\(encodedName.lowercased())")
            }
        }
        
        return components.joined(separator: "&")
    }
}
