//
//  MainResponseModel.swift
//  MeliChallenge2022
//
//  Created by Santiago Balestero on 29/7/22.
//

import Foundation

struct MainResponseModel: Codable {
    
    let siteId: String
    let query: String
    let results: [ProductModel]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.siteId = try container.decode(String.self, forKey: .siteId)
        self.query = try container.decode(String.self, forKey: .query)
        self.results = try container.decode([ProductModel].self, forKey: .results)
    }
    
    init(siteId: String, query: String, results: [ProductModel]) {
        self.siteId = siteId
        self.query = query
        self.results = results
    }
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case query
        case results
    }
}
