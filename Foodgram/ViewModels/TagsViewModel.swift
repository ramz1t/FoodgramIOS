//
//  TagsViewModel.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 13.08.2023.
//

import Foundation
import Observation

class TagsViewModel: Observable {
    var tags: [Tag] = []
    var state: FetcherState = .good
    
    func fetch() {
        guard tags.count == 0 else {
            return
        }
        
        DataLoader.request(.tags()) { result in
            switch result {
            case .success(let data):
                do {
                    let tags = try JSONDecoder().decode([Tag].self, from: data)
                    DispatchQueue.main.async {
                        self.tags = tags
                        self.state = .good
                    }
                } catch {
                    print(error)
                    self.state = .error("Failed to fetch tags")
                }
            case .failure:
                self.state = .error("error")
            }
        }
    }
    
    func getFilteredTags(query: String) -> [Tag] {
        guard query != "" else {
            return tags
        }
        return tags.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
}
