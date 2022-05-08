//
//  NineTestAppTests.swift
//  NineTestAppTests
//
//  Created by oleygen-private on 07.05.2022.
//

import XCTest
@testable import NineTestApp

class NineTestAppTests: XCTestCase {
    var storyService: StoryService?
    
    override func setUp() {
        self.storyService = StoryServiceMock()
    }

    func testFileName() throws {
        let fName = Bundle(for: type(of: self)).path(forResource: "StoryJson", ofType: "txt")
        XCTAssert(fName != nil)
    }
    
    func testMapping() throws {
        let expectation = expectation(description: "Simulate fetch and parse data")
        _ = self.storyService?.getStories(completion: { story, error in
            XCTAssert(story != nil)
            XCTAssert(story!.assets.count > 0)
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5)
    }
    
}
