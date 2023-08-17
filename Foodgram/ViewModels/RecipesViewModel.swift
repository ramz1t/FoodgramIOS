//
//  RecipesViewModel.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 07.08.2023.
//

import Foundation
import Observation

struct RecipeResponseWrapper: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Recipe]
}

@Observable class RecipesViewModel {
    var recipes: [Recipe] = []
    var state: FetcherState = .good
    var selectedTags: [Tag] = []
    
    
    func fetch() {
        guard let url = URL(string: "\(AppSettings.apiURL)/api/recipes?limit=999&\(arrayToQueryString(selectedTags ))") else {
            return
        }
        
        state = .loading
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print(error as Any)
                return
            }

            do {
                let responseWrapper = try JSONDecoder().decode(RecipeResponseWrapper.self, from: data)
                let recipes = responseWrapper.results
                DispatchQueue.main.async {
                    self?.recipes = recipes
                    self?.state = .good
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
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
