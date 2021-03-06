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
    
    // Describing Objects Upon Failure
    func test_assertNil() {
        let optionalValue: Int? = 123
        XCTAssertNil(optionalValue)
    }
    
    struct SimpleStruct {
        let x: Int
        let y: Int
    }
    
    func test_assertNil_withSimpleStruct() {
        let optionalValue: SimpleStruct? = SimpleStruct(x:1,y:2)
        XCTAssertNil(optionalValue)
    }
    
    // CostomStringConvertible
    struct StructWithDescription: CustomStringConvertible {
        let x: Int
        let y: Int
        
        var description: String {
            return "(\(x), \(y))"
        }
    }
    
    func test_assertNil_withSelfDescribingType() {
        let optionalValue: StructWithDescription = StructWithDescription(x: 1, y: 2)
        XCTAssertNil(optionalValue)
    }
    
    
    // Testing for Equality
    func test_assertEqual() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected")
    }
    
    // order of the arguments for unit test expected then actual
    // output from test expected $x but the actual value was $c
    
    // Testing Equality with Optionals
    func test_assertEqual_withOptional() {
        let result: String? = "foo"
        XCTAssertEqual(result, "bar")
    }
    
    // Fudging Equality with Doubles and Floats need to pass in argument to help with approximation
    func test_floatingPointDanger() {
        let result =  0.1 + 0.2
        XCTAssertEqual(result, 0.3)
    }
    
    func test_floatingPointFixed() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3, accuracy: 0.0001)
    }
    
    func test_messageOverKill() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected", "Expected \"expected\" but got \"\(actual)\"")
    }
}

/*
 Notes:
 Fail the test when something other than the expected outcome occurs

 Document how the System Under Test is supposed to behave (i.e., Tests as Documentation)

 */


var numberList: Array<Int> = [1,2,3,4,5,6,7,8,9,10]

// Linear Time vs Logarithmic

// Linear
/*
    While this approch achives our goal, each item contained in the set must be evaludated. A function like this is
    said to run in linear time because its speed is dependent on its input size. In other words, the algorithm becomes
    less efficient as its input size (n) grows
 */
extension Array where Element: Comparable {
    func linearSearch(forElement key: Element) -> Bool {
        //check all possible values
        for number in self {
            if number == key {
                return true
            }
        }
        
        return false
    }
}

// Binary Search Logarithmic
extension Array where Element: Comparable {
    mutating func binarySearch(forElement key: Element) -> Bool {
        var result = false
        
        //establish indices
        let min = self.startIndex
        let max = self.endIndex - 1
        let mid = startIndex + (self.count/2)
       
        // check bounds
        if key > self[max] || key < self[min] {
            print("search value \(key) not found")
            return false
        }
        
        let n = self[mid]
        
        if n > key {
            var slice = Array(self[min...mid - 1])
            result = slice.binarySearch(forElement: key)
        }
        else if n < key {
            var slice = Array(self[mid + 1...max])
            result = slice.binarySearch(forElement: key)
        }
        else {
            result = true
        }
        return result
    }
}

