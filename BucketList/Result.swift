//
//  Result.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 26.12.2025.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
