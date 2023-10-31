//
//  Menu.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/31/23.
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable {
    let name: String
    let price: Double
    let description: String
    let image: String
}
