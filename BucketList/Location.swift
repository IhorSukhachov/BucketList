//
//  Location.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 24.12.2025.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    
    var latitude: Double
    var longitude: Double
    
}
