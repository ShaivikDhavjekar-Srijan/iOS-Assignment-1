//
//  LandmarksUITests.swift
//  LandmarksUITests
//
//  Created by Shaivik Dhavjekar on 15/03/23.
//

import XCTest

class LandmarksUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testWelcome() throws {
        let app = XCUIApplication()
        app.launch()
     
        let welcome = app.images["Landmarks-Logo-Splash-Screen"]
     
        XCTAssert(welcome.exists)
    }

}
