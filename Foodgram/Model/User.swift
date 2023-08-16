//
//  User.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-15.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: Int
    let email: String
    let username: String
    let firstName: String
    let lastName: String
    let isSubscribed: Bool

    enum CodingKeys: String, CodingKey {
        case id, email, username, firstName = "first_name", lastName = "last_name", isSubscribed = "is_subscribed"
    }
}

extension User {
    static var MOCK = User(id: 1, email: "timurram007@gmail.com", username:"username", firstName: "Timur", lastName: "Ramazanov", isSubscribed: false)
}
