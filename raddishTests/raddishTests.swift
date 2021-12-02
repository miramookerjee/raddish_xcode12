//
//  raddishTests.swift
//  raddishTests
//
//  Created by Mira Mookerjee on 10/24/21.
//

import XCTest
@testable import raddish

class raddishTests: XCTestCase {

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
