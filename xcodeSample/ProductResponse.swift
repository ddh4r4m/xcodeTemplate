//
//  ProductResponse.swift
//  xcodeSample
//
//  Created by Dharam Dhurandhar on 11/02/24.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
