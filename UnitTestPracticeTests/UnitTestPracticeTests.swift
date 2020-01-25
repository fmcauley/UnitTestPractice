//
//  UnitTestPracticeTests.swift
//  UnitTestPracticeTests
//
//  Created by Frank McAuley on 1/22/20.
//  Copyright © 2020 Frank McAuley. All rights reserved.
//

import XCTest
@testable import UnitTestPractice

class UnitTestPracticeTests: XCTestCase {

    func test_fail() { //Given When Then
        XCTFail()
    }
    
    func test_fail_withSimpleMessage() {
        XCTFail("We have an issue!")
    }
    
    func test_fail_withStringInterpolationMessage() {
        let theAnswer = 42
        XCTFail("The answer to the question is: \(theAnswer)")
    }
    
    //bad : example of conditional logic in a test, this needs to be avoided
    func test_avoidConditionalCode() {
        let success = false
        if !success {
            XCTFail()
        }
    }
    
    func test_assertTrue() {
        let success = false
        XCTAssertTrue(success)
    }
}
