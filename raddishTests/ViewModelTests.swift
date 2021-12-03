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
  
  func testPopulateRecipes() {
    let viewModel = ViewModel()
    viewModel.populateRecipes()
    let seconds = 4.0
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssert(viewModel.recipes.count == 4)
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
    
    func testCreateRecipeBadURL() {
        //URL doesn't exist
        expectation = expectation(description: "Server responds in reasonable time")
        defer { waitForExpectations(timeout: expired) }

        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php")!
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
        let seconds = 4.0
        let vm = ViewModel()
        
        //ingredient does not exist
        vm.createRecipe(recipe: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.recipes.count, 0)
        }
    }
  
  func testCreateRecipeExpSoon() {
    let seconds = 4.0
    let vm = ViewModel()
    
    //recipe id doesn't exist
    vm.createRecipeExpSoon(recipeID: "1")
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      XCTAssertEqual(vm.recipesIngExpSoon.count, 0)
    }
    
    
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
    
    func testRetrieveMealswithIngBadURL() {
        //URL doesn't exist
        expectation = expectation(description: "Server responds in reasonable time")
        defer { waitForExpectations(timeout: expired) }

        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php")!
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
        
        let seconds = 4.0
        let vm = ViewModel()
        //ingredient does not exist
        vm.retrieveMealswithIng(ingredient: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.mealIngredients.count, 0)
        }
    }
    
    func testRetrieveMealswithIng () {
        
        let seconds = 4.0
        let vm = ViewModel()
        expectation = expectation(description: "Server responds in reasonable time")
        
        // ingredient doesn't exist
        defer { waitForExpectations(timeout: expired) }

        let url2 = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?i=garble")!
        URLSession.shared.dataTask(with: url2) { data, response, error in

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
        
        //ingredient does not exist
        vm.retrieveMealswithIng(ingredient: "garble")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.mealIngredients.count, 0)
        }
        
        //ingredient does exist
        vm.retrieveMealswithIng(ingredient: "blueberries")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.mealIngredients.count, 2)
        }
    }
    
    func testIngredientImages() {
        //Testing the specific ingredientImages function
        let seconds = 4.0
        let vm = ViewModel()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          //ingredient without a space
          XCTAssertEqual(vm.ingredientImages(ingredient: "chicken"), "https://www.themealdb.com/images/ingredients/chicken.png")
          //ingredient with a space
           XCTAssertEqual(vm.ingredientImages(ingredient: "olive oil"), "https://www.themealdb.com/images/ingredients/olive%oil.png")
        }
    }
    func testCreateMealIngRecipe () {
        let seconds = 4.0
        let vm = ViewModel()
        
        //nothing in mealIngredient
        vm.createMealIngRecipe()
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.recipesIng.count, 0)
        }
        
        //mealIngredient is already populated with pancakes
        vm.mealIngredients.append(MealIngredient(id:"52854",strMeal: "Pancakes", strMealThumb: "https://www.themealdb.com/images/media/meals/rwuyqx1511383174.jpg"))
        vm.createMealIngRecipe()
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.recipesIng.count, 1)
        }
        
        //add a bad MealIngredient
        vm.mealIngredients.append(MealIngredient(id:"1",strMeal: "Pancakes", strMealThumb: "https://www.themealdb.com/images/media/meals/rwuyqx1511383174.jpg"))
        vm.createMealIngRecipe()
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          XCTAssertEqual(vm.recipesIng.count, 1)
        }
        
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
    
    func testMissingIngredients() {
        let vm = ViewModel()
        let seconds = 2.0
        vm.pantry = [PantryItem(name: "Chicken", expiration: Date.inAWeek, date: Date())]
        vm.meals = [MealItem(day_of_week: "Monday", name: "Salmon Avocado Salad", imageURL: "", instructions: "", ingredient1: "Salmon", ingredient2: "Avocado", ingredient3: "Romaine Lettuce", ingredient4: "", ingredient5: "", ingredient6: "", ingredient7: "", ingredient8: "", ingredient9: "", ingredient10: "", ingredient11: "", ingredient12: "", ingredient13: "", ingredient14: "", ingredient15: "", ingredient16: "", ingredient17: "", ingredient18: "", ingredient19: "", ingredient20: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "", measure11: "", measure12: "", measure13: "", measure14: "", measure15: "", measure16: "", measure17: "", measure18: "", measure19: "", measure20: "", missingIng: false), MealItem(day_of_week: "Monday", name: "Dry Chicken", imageURL: "", instructions: "", ingredient1: "Chicken", ingredient2: "", ingredient3: "", ingredient4: "", ingredient5: "", ingredient6: "", ingredient7: "", ingredient8: "", ingredient9: "", ingredient10: "", ingredient11: "", ingredient12: "", ingredient13: "", ingredient14: "", ingredient15: "", ingredient16: "", ingredient17: "", ingredient18: "", ingredient19: "", ingredient20: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "", measure11: "", measure12: "", measure13: "", measure14: "", measure15: "", measure16: "", measure17: "", measure18: "", measure19: "", measure20: "", missingIng: false)]
        vm.checkMealsMissingIng()
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            XCTAssertEqual(vm.meals[0].missingIng, true)
            XCTAssertEqual(vm.meals[1].missingIng, false)
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
