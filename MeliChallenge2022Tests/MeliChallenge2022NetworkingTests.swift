//
//  MeliChallenge2022NetworkingTests.swift
//  MeliChallenge2022Tests
//
//  Created by Santiago Balestero on 1/8/22.
//

import XCTest
@testable import MeliChallenge2022

class MeliChallenge2022NetworkingTests: XCTestCase {
    // custom urlsession for mock network calls
    var urlSession: URLSession!

    override func setUpWithError() throws {
        // Set url session for mock networking
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MeliChallenge2022MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    
    func testGetProducts() throws {
        let productsAPI = ProductService(urlSession: urlSession)
        let product = ProductModel(title: "", price: 0.0, currency: "", image: "", permalink: "", quantity: 1, condition: "")
        let sampleProductsData = MainResponseModel(siteId: "", query: "", results: [product])
        let mockData = try JSONEncoder().encode(sampleProductsData)
        
        MeliChallenge2022MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        productsAPI.items(matching: "Auto") { products in
            XCTAssertTrue(products!.count > 0)
            XCTAssertEqual(products?[0].title, "pepe")
            expectation.fulfill()
        }
    }
}
