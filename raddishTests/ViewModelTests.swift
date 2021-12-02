//
//  ViewModelTests.swift
//  raddishTests
//
//  Created by Mira Mookerjee on 11/29/21.
//

import XCTest
import Foundation
@testable import raddish

class ViewModelTests: XCTestCase {

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
  
  func testPopulateRecipes() {
    let viewModel = ViewModel()
    viewModel.populateRecipes()
    let seconds = 4.0
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssert(viewModel.recipes.count == 4)
    }

  }

}
