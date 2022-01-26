//
//  Category.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 25.01.2022.
//

import Foundation

struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    let tagline: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case imageURL = "image_url"
    }
}
