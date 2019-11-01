//
//  LifeStyleModels.swift
//  Lifestyle
//
//  Created by SAGAR THAKARE on 01/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation

struct LifeStyleModel: Decodable {
    let categories: [Categories]
    let rankings: [Ranking]
}

struct Categories: Decodable  {
    let id: Int
    let name: String
    let products: [Product]?
    let childCategories: [Int]
}

struct Product: Decodable {
    let id: Int
    let name: String
    let dateAdded: String
    let variants: [Varients]?
    let tax: Tax
    let viewCount: Int?
}

struct Varients: Decodable {
    let id: Int?
    let color: String?
    let size: Int?
    let price: Int?
}

struct Tax: Decodable {
    let name: String
    let value: Double
}

struct Ranking: Decodable {
    let ranking: String
    let products: [ProductRanking]?
}

struct ProductRanking: Decodable {
    let id: Int
    let viewCount: Int?
    let orderCount: Int?
    let shares: Int?
}
