//
//  PantryTests.swift
//  raddishTests
//
//  Created by Mira Mookerjee on 11/3/21.
//

import XCTest
import CoreData
@testable import raddish

//Taken from: https://www.raywenderlich.com/11349416-unit-testing-core-data-in-ios
class PantryTests: XCTestCase {

    let expired: TimeInterval = 10
    var expectation: XCTestExpectation!
    
  override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testExample() throws {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testPerformanceExample() throws {
      // This is an example of a performance test case.
      self.measure {
          // Put the code you want to measure the time of here.
      }
  }
  
  func testDisplayName() {
    let pantryItem = PantryItem(name: "Eggs", expiration: NSDate(), date: Date())
    let name = pantryItem.displayName()
    XCTAssertEqual(name, "Eggs")
  }
  
  
    func testNADisplayName() {
      let pantryItem = PantryItem(name: nil, expiration: NSDate(), date: Date())
      let name = pantryItem.displayName()
      XCTAssertEqual(name, "n/a")
    }
    
}

//}
