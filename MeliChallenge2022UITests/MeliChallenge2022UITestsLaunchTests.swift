//
//  MeliChallenge2022UITestsLaunchTests.swift
//  MeliChallenge2022UITests
//
//  Created by Santiago Balestero on 29/7/22.
//

import XCTest

class MeliChallenge2022UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
