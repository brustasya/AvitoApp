//
//  ProductModel.swift
//  AvitoApp
//
//  Created by Станислава on 27.08.2023.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let advertisements: [T]
}

struct Advertisement: Codable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageURL: String
    let createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case location = "location"
        case imageURL = "image_url"
        case createdDate = "created_date"
    }
}
