//
//  MeliChallenge2022ProductTableViewUITest.swift
//  MeliChallenge2022UITests
//
//  Created by Santiago Balestero on 30/7/22.
//

import XCTest

class MeliChallenge2022ProductTableViewUITest: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    func testSelectProductCell() {
        let searchBar = app.searchFields.firstMatch
        searchBar.tap()
        searchBar.typeText("Auto")
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: 5.0)
        let firstCell = app.cells.element(boundBy: 0)
        firstCell.tap()
        let backButtonTitle = app.navigationBars.buttons.element(boundBy: 0).label
        XCTAssertEqual(backButtonTitle, "MELI CHALLENGE")
    }
}
