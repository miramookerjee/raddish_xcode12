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
  
  func testDisplayInstructions() {
    let mealItem = MealItem(day_of_week: nil, name: nil, imageURL: nil, instructions: "Boil potatoes")
    let instructions = mealItem.displayInstructions()
    XCTAssertEqual(instructions, "Boil potatoes")

  }
  
  func testNADisplayInstructions() {
    let mealItem = MealItem(day_of_week: nil, name: nil, imageURL: nil, instructions: nil)
    let instructions = mealItem.displayInstructions()
    XCTAssertEqual(instructions, "n/a")
  }
  
  func testDisplayIngredients() {
    let mealItem = MealItem(
      day_of_week: "Monday", name: "Penne Arrabiata",
      imageURL: "www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata",
      ingredient1: "penne rigate", ingredient2: "olive oil", ingredient3: "garlic",
      ingredient4: "chopped tomatoes", ingredient5: "red chile flakes", ingredient6: "italian seasoning",
      ingredient7: "basil", ingredient8: "Parmigiano-Reggiano", ingredient9: "",
      ingredient10: "", ingredient11: "", ingredient12: "",
      ingredient13: "", ingredient14: "", ingredient15: "",
      ingredient16: nil, ingredient17: nil, ingredient18: nil,
      ingredient19: nil, ingredient20: nil,
      measure1: "1 pound", measure2: "1/4 cup", measure3: "3 cloves",
      measure4: "1 tin ", measure5: "1/2 teaspoon", measure6: "1/2 teaspoon",
      measure7: "6 leaves", measure8: "spinkling", measure9: "",
      measure10: "", measure11: "", measure12: "",
      measure13: "", measure14: "", measure15: "",
      measure16: "", measure17: "", measure18: "",
      measure19: "", measure20: ""
    )
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
  
  func testDisplayNAIngredients() {
    let mealItem = MealItem(
      day_of_week: "Monday", name: "Penne Arrabiata",
      imageURL: "www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata",
      ingredient1: nil, ingredient2: nil, ingredient3: nil,
      ingredient4: nil, ingredient5: nil, ingredient6: nil,
      ingredient7: nil, ingredient8: nil, ingredient9: nil,
      ingredient10: nil, ingredient11: nil, ingredient12: nil,
      ingredient13: nil, ingredient14: nil, ingredient15: nil,
      ingredient16: nil, ingredient17: nil, ingredient18: nil,
      ingredient19: nil, ingredient20: nil,
      measure1: nil, measure2: nil, measure3: nil,
      measure4: nil, measure5: nil, measure6: nil,
      measure7: nil, measure8: nil, measure9: nil,
      measure10: nil, measure11: nil, measure12: nil,
      measure13: nil, measure14: nil, measure15: nil,
      measure16: nil, measure17: nil, measure18: nil,
      measure19: nil, measure20: nil
    )
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

    XCTAssertEqual(ingredient1, "")
    XCTAssertEqual(ingredient2, "")
    XCTAssertEqual(ingredient3, "")
    XCTAssertEqual(ingredient4, "")
    XCTAssertEqual(ingredient5, "")
    XCTAssertEqual(ingredient6, "")
    XCTAssertEqual(ingredient7, "")
    XCTAssertEqual(ingredient8, "")
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
    
    XCTAssertEqual(measure1, "")
    XCTAssertEqual(measure2, "")
    XCTAssertEqual(measure3, "")
    XCTAssertEqual(measure4, "")
    XCTAssertEqual(measure5, "")
    XCTAssertEqual(measure6, "")
    XCTAssertEqual(measure7, "")
    XCTAssertEqual(measure8, "")
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
