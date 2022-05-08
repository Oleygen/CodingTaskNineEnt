//
//  NineTestAppUITests.swift
//  NineTestAppUITests
//
//  Created by oleygen-private on 07.05.2022.
//

import XCTest

class NineTestAppUITests: XCTestCase {
   
    func testFailFifthElementWithoutScroll() throws {
        let app = XCUIApplication()
        app.launch()
        let cell5 = app.cells["StoryCell#4"]
        wait(seconds: 2)
        XCTAssertFalse(cell5.exists)
    }
    
    func testScrollToFifthElement() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.swipeUp()
        app.swipeUp()
        let cell5 = app.cells["StoryCell#4"]
        wait(seconds: 2)
        XCTAssert(cell5.exists)
    }
    
    func testSegueOnTap() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.cells.element(boundBy: 0).tap() // tap on first cell
        let progressView = app.progressIndicators["ProgressView"]
        wait(seconds: 2)
        XCTAssert(progressView.exists)
    }
    
    private func wait(seconds: Int) {
        Thread.sleep(forTimeInterval: TimeInterval(seconds))
    }
}
