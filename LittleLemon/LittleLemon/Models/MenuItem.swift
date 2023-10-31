//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/31/23.
//

import Foundation

struct MenuItem: Decodable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let desc: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case price = "price"
        case category = "category"
        case desc = "description"
    }
    
}
