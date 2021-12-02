//
//  ViewModelTests.swift
//  raddishTests
//
//  Created by Esteban Vazquez Cardona on 12/1/21.
//

import XCTest
import Foundation
@testable import raddish

class ViewModelTests: XCTestCase {
  
  let expired: TimeInterval = 6
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
  
  func testPopulateRecipesIngExpSoon () {
    let seconds = 4.0
    let vm = ViewModel()
    
    // with recipes
    vm.recipesIngExpSoon = []
    let recipes1: Set<String> = ["52940", "52846", "52934"]
    vm.populateRecipesIngExpSoon(recipes1)
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssertEqual(vm.recipesIngExpSoon.count, 3)
    }

    // with no recipes
    vm.recipesIngExpSoon = []
    let recipes2: Set<String> = []
    vm.populateRecipesIngExpSoon(recipes2)
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssertEqual(vm.recipesIngExpSoon.count, 0)
    }
  }
  
  func testCreateRecipeExpSoon() {
    let seconds = 4.0
    let vm = ViewModel()
    
    // recipe id exists (Chicken Marengo)
    vm.createRecipeExpSoon(recipeID: "52920")
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssertEqual(vm.recipesIngExpSoon.count, 1)
    }
    
    // recipe id doesn't exist (id: 1)
    expectation = expectation(description: "Server responds in reasonable time")
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=1")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      guard let data = data else {
          print("Error: No data to decode")
          return
        }
      
        guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
          print("Error: Couldn't decode data into a result")
          self.expectation.fulfill()
          return
      }
    }
    .resume()
  }
  
  func testfetchRecipesIngExpSoon() {
    let seconds = 2.0
    let vm = ViewModel()
    vm.recipesIngExpSoon = []
    
    // pantry with ing expiring soon
    vm.pantry = [PantryItem(name: "Chicken", expiration: Date.tomorrow, date: Date())]
    vm.fetchRecipesIngExpSoon()
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssertEqual(vm.recipesIngExpSoon.count, 1)
    }
    
    // pantry without ingredients exp soon
    vm.pantry = [PantryItem(name: "Chicken", expiration: Date.inAWeek, date: Date())]
    vm.fetchRecipesIngExpSoon()
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssertEqual(vm.recipesIngExpSoon, [])
    }
  }
  
  func testCleanIngNameForAPI() {
    let vm = ViewModel()
    
    let s1 = "Chicken"
    let s2 = "Chicken Breast"
    let s3 = "CHICKEN"
    
    XCTAssertEqual(vm.cleanIngNameForAPI(ing: s1), "chicken")
    XCTAssertEqual(vm.cleanIngNameForAPI(ing: s2), "chicken_breast")
    XCTAssertEqual(vm.cleanIngNameForAPI(ing: s3), "chicken")
  }
  
  func testDaysBetween() {
    let vm = ViewModel()
    
    let twoDaysAgo = Date.twoDaysAgo
    let yesterday = Date.yesterday
    let tomorrow = Date.tomorrow
    let inTwoDays = Date.inTwoDays
    let today = Date()
    
    XCTAssertEqual(vm.daysBetween(start: today, end: twoDaysAgo), -1)
    XCTAssertEqual(vm.daysBetween(start: today, end: yesterday), 0)
    XCTAssertEqual(vm.daysBetween(start: today, end: tomorrow), 1)
    XCTAssertEqual(vm.daysBetween(start: today, end: today), 1)
    XCTAssertEqual(vm.daysBetween(start: today, end: inTwoDays), 2)
  }
  
  func testFetchItemsExpiringSoon() {
    let vm = ViewModel()
    
    //empty pantry
    vm.pantry = []
    XCTAssertEqual(vm.fetchItemsExpiringSoon(), [])
    
    // pantry with several items
    let item1 = PantryItem(name: "Chicken", expiration: Date.tomorrow, date: Date())
    let item2 = PantryItem(name: "Beef", expiration: Date.inTwoDays, date: Date())
    let item3 = PantryItem(name: "Milk", expiration: Date.inAWeek, date: Date())
    vm.pantry = [item1, item2, item3]
    XCTAssertEqual(vm.fetchItemsExpiringSoon(), [item1, item2])
    
    // pantry with items with dates on edge
    let item4 = PantryItem(name: "Chicken",
                           expiration: Calendar.current.date(byAdding: .day, value: 5, to: Date())!,
                           date: Date())
    let item5 = PantryItem(name: "Beef",
                          expiration: Calendar.current.date(byAdding: .day, value: 6, to: Date())!,
                          date: Date())
    vm.pantry = [item4, item5]
    XCTAssertEqual(vm.fetchItemsExpiringSoon(), [item4])
    
    // pantry with already expired items
    let item6 = PantryItem(name: "Chicken", expiration: Date.yesterday, date: Date())
    vm.pantry = [item6]
    XCTAssertEqual(vm.fetchItemsExpiringSoon(), [item6])
  }
  
  // MARK: Sometimes works, sometimes doesn't
  func testGetIngExp() {
    let vm = ViewModel()
    
    // ingredient is in dictionary
    XCTAssertEqual(vm.getIngExp("chicken", Date.noon), Calendar.current.date(byAdding: .day, value: 3, to: Date.noon)!)
    
    // ingredient is not in dictionary
    XCTAssertEqual(vm.getIngExp("Pork", Date()), Date())
    
    // case sensitivity
    XCTAssertEqual(vm.getIngExp("ChicKen", Date.noon), Calendar.current.date(byAdding: .day, value: 3, to: Date.noon)!)
    
    // whitespace
    XCTAssertEqual(vm.getIngExp("Chicken ", Date.noon), Calendar.current.date(byAdding: .day, value: 3, to: Date.noon)!)
  }

}

// From: https://stackoverflow.com/questions/44009804/swift-3-how-to-get-date-for-tomorrow-and-yesterday-take-care-special-case-ne/44009988
extension Date {
  static var twoDaysAgo: Date { return Date().twoDaysBefore }
  static var yesterday: Date { return Date().dayBefore }
  static var tomorrow:  Date { return Date().dayAfter }
  static var inTwoDays: Date { return Date().twoDaysAfter }
  static var inAWeek: Date { return Date().aWeekAfter }
  static var noon: Date { return Date().noon }
  
  var twoDaysBefore: Date {
    return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
  }
  
  var dayBefore: Date {
      return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
  }
  
  var dayAfter: Date {
      return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
  }
  
  var twoDaysAfter: Date {
    return Calendar.current.date(byAdding: .day, value: 2, to: noon)!
  }
  
  var aWeekAfter: Date {
    return Calendar.current.date(byAdding: .day, value: 7, to: noon)!
  }
  
  var noon: Date {
      return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
  }
  
  var month: Int {
      return Calendar.current.component(.month,  from: self)
  }
  
  var isLastDayOfMonth: Bool {
      return dayAfter.month != month
  }
}
