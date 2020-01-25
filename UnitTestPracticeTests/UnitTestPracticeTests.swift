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
}
