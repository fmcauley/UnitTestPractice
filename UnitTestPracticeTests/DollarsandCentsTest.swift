//
//  DollarsandCentsTest.swift
//  UnitTestPracticeTests
//
//  Created by Frank McAuley on 1/29/20.
//  Copyright © 2020 Frank McAuley. All rights reserved.
//

import XCTest

class DollarsandCentsTest: XCTestCase {

    func test_given3_outputWouldBeThreeDollars() {
        let actual = DollarsandCents().formatMoney(3)
        let expected = "$3.00"
        XCTAssertEqual(actual, expected)
    }
    
    func test_given4_outputWouldBeFourDollars() {
        let actual = DollarsandCents().formatMoney(4)
        let expected = "$4.00"
        XCTAssertEqual(actual, expected)
    }
    
    func test_given3point2_outputWouldBeThreeDollarsTwentyCents() {
        let actual = DollarsandCents().formatMoney(3.2)
        let expected = "$3.20"
        XCTAssertEqual(actual, expected)
    }
}

class DollarsandCents {
    func formatMoney(_ val: Double) -> String {
        let convert = val.description
        let values = "$\(convert)0"
        return values
    }
}
