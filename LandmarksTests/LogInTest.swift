//
//  LogInTest.swift
//  LandmarksTests
//
//  Created by Shaivik Dhavjekar on 29/04/23.
//

import XCTest
@testable import Landmarks

final class LogInTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItShouldShowWrongUserNameWhenUserNameIsWrong() throws {
        
        let model = LogInViewModel()
        
        model.authenticateUser(username: "", password: "")
        
        XCTAssertEqual(model.wrongUserName, 3)
    }

    func testItShouldShowWrongPasswordWhenPasswordIsWrong() throws {
        
        let model = LogInViewModel()
        
        model.authenticateUser(username: "", password: "")
        
        XCTAssertEqual(model.wrongPassword, 3)
    }

}
