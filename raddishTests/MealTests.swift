//
//  MealTests.swift
//  raddishTests
//
//  Created by Mira Mookerjee on 11/3/21.
//

import XCTest
@testable import raddish

class MealTests: XCTestCase {

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
      
      let mealItem = MealItem(day_of_week: "Monday", name: "Penne Arrabiata", imageURL: "www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata")
      let name = mealItem.displayName()
      let day_of_week = mealItem.displayDayOfWeek()
      let imageURL = mealItem.displayimageURL()
      XCTAssertEqual(name, "Penne Arrabiata")
      XCTAssertEqual(day_of_week, "Monday")
      XCTAssertEqual(imageURL, "www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata")
  }
  
  func testNADisplayName() {
    let mealItem = MealItem(day_of_week: nil, name: nil, imageURL: nil)
    let name = mealItem.displayName()
    let day_of_week = mealItem.displayDayOfWeek()
    let imageURL = mealItem.displayimageURL()
    XCTAssertEqual(name, "n/a")
    XCTAssertEqual(day_of_week, "n/a")
    XCTAssertEqual(imageURL, "n/a")
  }
  
  // test saveMealItem
  
  // test fetchMealtems()
  
  // test updateMealItems()
  
  // test updateMealItems()

}
