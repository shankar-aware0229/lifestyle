//
//  LifeStyleModels.swift
//  Lifestyle
//
//  Created by SAGAR THAKARE on 01/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation

struct LifeStyleModel: Decodable, Equatable {
    let categories: Categories
    let rankings: Ranking
}

struct Categories: Decodable, Equatable {
    let id: Int
    let name: String
    let products: [Product]
    let body: String
}

struct Product: Decodable, Equatable{
    let id: Int
    let name: String
    let dateAdded: String
    let varients: [Varients]
    let viewConunt: Int
}

struct Varients: Decodable, Equatable {
    let id: Int
    let color: String
    let size: Int
    let price: Int
}

struct Ranking: Decodable, Equatable {
    let ranking: String
    let products: [Product]
}
