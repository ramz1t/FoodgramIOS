//
//  TagsViewModel.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 13.08.2023.
//

import Foundation
import Observation

@Observable class TagsViewModel {
    var tags: [Tag] = []
    var state: FetcherState = .good
    
    func fetch() {
        guard tags.count == 0 else {
            return
        }
        
        guard let url = URL(string: "\(AppSettings.apiURL)/api/tags") else {
            return
        }
        
        state = .loading
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print(error as Any)
                return
            }

            do {
                let tags = try JSONDecoder().decode([Tag].self, from: data)
                DispatchQueue.main.async {
                    self?.tags = tags
                    self?.state = .good
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getFilteredTags(query: String) -> [Tag] {
        guard query != "" else {
            return tags
        }
        return tags.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
}
