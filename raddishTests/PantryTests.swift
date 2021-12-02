//
//  PantryTests.swift
//  raddishTests
//
//  Created by Mira Mookerjee on 11/3/21.
//

import XCTest
import CoreData
import Foundation
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
    let pantryItem = PantryItem(name: "Eggs", expiration: Date(), date: Date())
    let name = pantryItem.displayName()
    XCTAssertEqual(name, "Eggs")
  }
  
  
  func testNADisplayName() {
    let pantryItem = PantryItem(name: nil, expiration: Date(), date: Date())
    let name = pantryItem.displayName()
    XCTAssertEqual(name, "n/a")
  }
  
  func testDisplayDate() {
    let item1 = PantryItem(name: "Chicken", expiration: Date.inTwoDays, date: Date())
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YY"
    XCTAssertEqual(item1.displayDate(), dateFormatter.string(from: Date()))
    
    let item2 = PantryItem(name: "Chicken", expiration: Date.inTwoDays, date: nil)
    XCTAssertEqual(item2.displayDate(), dateFormatter.string(from: Date()))
  }
  
  func testDisplayExpDate() {
    let item1 = PantryItem(name: "Chicken", expiration: Date.inTwoDays, date: Date())
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YY"
    XCTAssertEqual(item1.displayExpDate(), dateFormatter.string(from: Date.inTwoDays))
    
    let item2 = PantryItem(name: "Chicken", expiration: nil, date: Date())
    XCTAssertEqual(item2.displayDate(), dateFormatter.string(from: Date()))
  }
  
  func testDisplayExpDays() {
    let item1 = PantryItem(name: "Chicken", expiration: Date.inTwoDays, date: Date())
    XCTAssertEqual(item1.displayExpDays(), "Expires in 2 days")
    
    let item2 = PantryItem(name: "Chicken", expiration: Date(), date: Date())
    XCTAssertEqual(item2.displayExpDays(), "Expires in 1 day")
    
    let item3 = PantryItem(name: "Chicken", expiration: Date.yesterday, date: Date())
    XCTAssertEqual(item3.displayExpDays(), "Expired yesterday")
    
    let item4 = PantryItem(name: "Chicken", expiration: Date.twoDaysAgo, date: Date())
    XCTAssertEqual(item4.displayExpDays(), "Expired 2 days ago")
  }
    
}


