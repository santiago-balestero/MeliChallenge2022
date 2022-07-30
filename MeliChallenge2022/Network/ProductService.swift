//
//  ProductService.swift
//  MeliChallenge2022
//
//  Created by Santiago Balestero on 29/7/22.
//

import Foundation

class ProductService {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func items(matching query: String, completion: @escaping ([ProductModel]?) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = NSLocalizedString("baseUrl", comment: "")
        urlComponents.path = NSLocalizedString("productSearchEndpoint", comment: "")
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        
        urlSession.dataTask(with: urlComponents.url!, completionHandler: { (data, response, error) in
            var items: [ProductModel] = []
            guard let data = data,
                  let mainJson = try? JSONDecoder().decode(MainResponseModel.self, from: data),
                  error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            for result in mainJson.results {
                items.append(result)
            }
            DispatchQueue.main.async {
                completion(items)
            }
        }).resume()
    }
}
