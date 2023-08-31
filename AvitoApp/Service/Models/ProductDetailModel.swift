//
//  ProductDetailModel.swift
//  AvitoApp
//
//  Created by Станислава on 27.08.2023.
//

import Foundation

struct ProductDetailModel: Codable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageURL: String
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case location = "location"
        case imageURL = "image_url"
        case createdDate = "created_date"
        case description = "description"
        case email = "email"
        case phoneNumber = "phone_number"
        case address = "address"
    }
}
