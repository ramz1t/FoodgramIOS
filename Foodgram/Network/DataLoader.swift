//
//  DataLoader.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 25.09.2023.
//

import Foundation

struct DataLoader {
    static func request(_ endpoint: Endpoint,
                        then handler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = endpoint.url else {
            return handler(.failure(DataLoaderError.invalidUrl))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil && data != nil else {
                return handler(.failure(DataLoaderError.fetchingFail))
            }
            
            handler(.success(data!))
        }
        
        task.resume()
    }
}
