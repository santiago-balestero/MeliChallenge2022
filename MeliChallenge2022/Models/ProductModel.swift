//
//  ProductModel.swift
//  MeliChallenge2022
//
//  Created by Santiago Balestero on 29/7/22.
//

import Foundation

struct ProductModel: Codable {
    
    let title: String
    let price: Float
    let currency: String
    let image: String
    let permalink: String
    let quantity: Int
    let condition: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Float.self, forKey: .price)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.image = try "https" + container.decode(String.self, forKey: .image).dropFirst(4)
        self.permalink = try container.decode(String.self, forKey: .permalink)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
        self.condition = try container.decode(String.self, forKey: .condition)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case price
        case currency = "currency_id"
        case image = "thumbnail"
        case permalink
        case condition
        case quantity = "available_quantity"
        
    }
}
