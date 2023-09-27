//
//  Recipe.swift
//  Foodgram
//
//  Created by Timur Ramazanov on 2023-07-15.
//

import Foundation
import SwiftUI

struct Recipe: Codable, Identifiable {
    let id: Int
    let author: User
    var tags: [Tag]
    var ingredients: [Ingredient]
    var isFavorited: Bool
    var isInShoppingCart: Bool
    var name: String
    var image: String
    var text: String
    var cookingTime: Int
    
    enum CodingKeys: String, CodingKey {
        case id, author, tags, ingredients, isFavorited = "is_favorited", isInShoppingCart = "is_in_shopping_cart", name, image, text, cookingTime = "cooking_time"
    }
}

struct Tag: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let color: String
    let slug: String
}

struct Ingredient: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let measurementUnit: String
    let amount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, measurementUnit = "measurement_unit", amount
    }
}


extension Recipe {
    static let MOCK = Recipe(id: 1,
                             author: User.MOCK,
                             tags: Tag.MOCK,
                             ingredients: Ingredient.MOCK,
                             isFavorited: true,
                             isInShoppingCart: true,
                             name: "Sausages with pasta",
                             image: "http://opns-st-1.aboard.ru:34081/media/recipe/image/92247582-a935-489e-9c57-bba325306462.jpg",
                             text: "Классический куриной суп - это утешительное блюдо, которое согреет вас в холодные дни и поднимет настроение. Для его приготовления возьмите средний куриный окорок (или грудку), нарежьте овощи - морковь, лук, картофель, чеснок. Варите куриную грудку до мягкости, а затем добавьте к ней овощи и специи - лавровый лист, соль и перец. После варки удалите лавровый лист и подавайте суп, посыпанный свежей петрушкой или укропом. Приятного аппетита!",
                             cookingTime: 60)
}

extension Tag {
    static let MOCK: [Tag] = [.init(id: 2,
                                    name: "Breakfast",
                                    color: "#FFA500",
                                    slug: "breakfast"),
                              .init(id: 3,
                                    name: "Dinner",
                                    color: "#FF1667",
                                    slug: "breakfast"),
                              .init(id: 4,
                                    name: "Lunch",
                                    color: "#0F2699",
                                    slug: "breakfast"),
                              .init(id: 5,
                                    name: "Vegan",
                                    color: "#10A570",
                                    slug: "breakfast")]
}

extension Ingredient {
    static let MOCK: [Ingredient] = [.init(id: 1,
                                           name: "Beef",
                                           measurementUnit: "g.",
                                           amount: 350),
                                     .init(id: 2,
                                           name: "Carrots",
                                           measurementUnit: "g.",
                                           amount: 150),
                                     .init(id: 3,
                                           name: "Onions",
                                           measurementUnit: "g.",
                                           amount: 350),
                                     .init(id: 4,
                                           name: "Cheese",
                                           measurementUnit: "g.",
                                           amount: 350),
                                     .init(id: 5,
                                           name: "Sour cream",
                                           measurementUnit: "g.",
                                           amount: 350),
                                     .init(id: 6,
                                           name: "Potatos",
                                           measurementUnit: "g.",
                                           amount: 350)]
}
