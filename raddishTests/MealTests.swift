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
  
  func testDisplayIngredients() {
    let mealItem = MealItem(day_of_week: "Monday", name: "Penne Arrabiata", imageURL: "www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata")
    let ingredient1 = mealItem.displayIngredient1()
    let ingredient2 = mealItem.displayIngredient2()
    let ingredient3 = mealItem.displayIngredient3()
    let ingredient4 = mealItem.displayIngredient4()
    let ingredient5 = mealItem.displayIngredient5()
    let ingredient6 = mealItem.displayIngredient6()
    let ingredient7 = mealItem.displayIngredient7()
    let ingredient8 = mealItem.displayIngredient8()
    let ingredient9 = mealItem.displayIngredient9()
    let ingredient10 = mealItem.displayIngredient10()
    let ingredient11 = mealItem.displayIngredient11()
    let ingredient12 = mealItem.displayIngredient12()
    let ingredient13 = mealItem.displayIngredient13()
    let ingredient14 = mealItem.displayIngredient14()
    let ingredient15 = mealItem.displayIngredient15()
    let ingredient16 = mealItem.displayIngredient16()
    let ingredient17 = mealItem.displayIngredient17()
    let ingredient18 = mealItem.displayIngredient18()
    let ingredient19 = mealItem.displayIngredient19()
    let ingredient20 = mealItem.displayIngredient20()

    XCTAssertEqual(ingredient1, "penne rigate")
    XCTAssertEqual(ingredient2, "olive oil")
    XCTAssertEqual(ingredient3, "garlic")
    XCTAssertEqual(ingredient4, "chopped tomatoes")
    XCTAssertEqual(ingredient5, "red chile flakes")
    XCTAssertEqual(ingredient6, "italian seasoning")
    XCTAssertEqual(ingredient7, "basil")
    XCTAssertEqual(ingredient8, "Parmigiano-Reggiano")
    XCTAssertEqual(ingredient9, "")
    XCTAssertEqual(ingredient10, "")
    XCTAssertEqual(ingredient11, "")
    XCTAssertEqual(ingredient12, "")
    XCTAssertEqual(ingredient13, "")
    XCTAssertEqual(ingredient14, "")
    XCTAssertEqual(ingredient15, "")
    XCTAssertEqual(ingredient16, "")
    XCTAssertEqual(ingredient17, "")
    XCTAssertEqual(ingredient18, "")
    XCTAssertEqual(ingredient19, "")
    XCTAssertEqual(ingredient20, "")
    
    let measure1 = mealItem.displayMeasure1()
    let measure2 = mealItem.displayMeasure2()
    let measure3 = mealItem.displayMeasure3()
    let measure4 = mealItem.displayMeasure4()
    let measure5 = mealItem.displayMeasure5()
    let measure6 = mealItem.displayMeasure6()
    let measure7 = mealItem.displayMeasure7()
    let measure8 = mealItem.displayMeasure8()
    let measure9 = mealItem.displayMeasure9()
    let measure10 = mealItem.displayMeasure10()
    let measure11 = mealItem.displayMeasure11()
    let measure12 = mealItem.displayMeasure12()
    let measure13 = mealItem.displayMeasure13()
    let measure14 = mealItem.displayMeasure14()
    let measure15 = mealItem.displayMeasure15()
    let measure16 = mealItem.displayMeasure16()
    let measure17 = mealItem.displayMeasure17()
    let measure18 = mealItem.displayMeasure18()
    let measure19 = mealItem.displayMeasure19()
    let measure20 = mealItem.displayMeasure20()
    
    XCTAssertEqual(measure1, "1 pound")
    XCTAssertEqual(measure2, "1/4 cup")
    XCTAssertEqual(measure3, "3 cloves")
    XCTAssertEqual(measure4, "1 tin ")
    XCTAssertEqual(measure5, "1/2 teaspoon")
    XCTAssertEqual(measure6, "1/2 teaspoon")
    XCTAssertEqual(measure7, "6 leaves")
    XCTAssertEqual(measure8, "spinkling")
    XCTAssertEqual(measure9, "")
    XCTAssertEqual(measure10, "")
    XCTAssertEqual(measure11, "")
    XCTAssertEqual(measure12, "")
    XCTAssertEqual(measure13, "")
    XCTAssertEqual(measure14, "")
    XCTAssertEqual(measure15, "")
    XCTAssertEqual(measure16, "")
    XCTAssertEqual(measure17, "")
    XCTAssertEqual(measure18, "")
    XCTAssertEqual(measure19, "")
    XCTAssertEqual(measure20, "")
    
    
    
  }


}
