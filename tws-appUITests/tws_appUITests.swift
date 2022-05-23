//
//  tws_appUITests.swift
//  tws-appUITests
//
//  Created by Wiljay Flores on 2022-05-07.
//

import XCTest

class tws_appUITests: XCTestCase {

    func testHappyPath() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments.append("Testing")
        app.launch()
        
        XCTAssertTrue(app.buttons["Start"].exists)
        
        app.buttons["Start"].tap()
        
        XCTAssertTrue(app.staticTexts["Mock question 1"].exists)
        XCTAssertTrue(app.buttons["answer 1"].exists)
        XCTAssertTrue(app.buttons["answer 2"].exists)
        
        app.buttons["answer 1"].tap()
        
        XCTAssertTrue(app.buttons["Continue"].exists)
        
        app.buttons["Continue"].tap()
        
        XCTAssertTrue(app.staticTexts["You are a Bloom Collector"].exists)
        
        app.staticTexts["You are a Bloom Collector"].swipeLeft()
        
        XCTAssertTrue(app.staticTexts["mock mantra"].exists)
        
    }

}
