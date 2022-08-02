//
//  MeliChallenge2022SearchBarUITests.swift
//  MeliChallenge2022UITests
//
//  Created by Santiago Balestero on 29/7/22.
//

import XCTest

class MeliChallenge2022SearchBarUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    func testSearchBarExists() {
        let searchBar = app.searchFields.firstMatch
        XCTAssertTrue(searchBar.exists)
        searchBar.tap()
        searchBar.typeText("Auto")
    }
    
    func testSearchItem() {
        let searchBar = app.searchFields.firstMatch
        searchBar.tap()
        searchBar.typeText("Auto")
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: 5.0)
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
    }
    
    func testCancelSearchButton() {
        let searchBar = app.searchFields.firstMatch
        searchBar.tap()
        searchBar.typeText("Auto")
        let cancelButton = app.navigationBars.buttons.element(boundBy: 0)
        cancelButton.tap()
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertFalse(firstCell.exists)
    }
}
