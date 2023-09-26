//
//  Endpoint.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 25.09.2023.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    
    init(path: String, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.queryItems = queryItems
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = AppSettings.serverScheme
        components.host = AppSettings.serverHost
        components.port = AppSettings.serverPort
        components.path = AppSettings.apiPrefix + path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension Endpoint {
    static func recipes(matching query: String, tags: [Tag]) -> Endpoint {
        Endpoint(
            path: "/recipes",
            queryItems: tags.map {
                URLQueryItem(name: "tags", value: $0.name.lowercased())
            }
        )
    }
}

extension Endpoint {
    static func tags() -> Endpoint {
        Endpoint(path: "/tags")
    }
}
