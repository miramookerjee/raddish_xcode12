//
//  ViewModel.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//
import Foundation
import Photos
import SwiftUI
import UIKit
import CoreData

class ViewModel: ObservableObject {
  let appDelegate: AppDelegate = AppDelegate()
  @Published var pantry = [PantryItem]()
  @Published var recipes = [Recipe]()
  @Published var meals = [MealItem] ()
  @Published var mealIngredients = [MealIngredient] ()
  @Published var recipesIng = [Recipe]()
  var recipesToPopulate = ["Arrabiata", "Soup", "sandwich", "salad"]
  var expiration_data = ["Juice":21,"Butter":30,"Buttermilk":7,"Parmesan":30,"Cream":3,"Eggnog":3,"Eggs":21,"Kefir":7,"Milk":7,"Yogurt":7,"Tofu":7,"Caviar":7,"Surimi":3,"Shrimp":1,"Crab":1,"Lobster":1,"Beef":3,"Giblets":21,"Apples":2,"Apricots":3,"Avocados":2,"Bananas":1,"Berries":7,"Coconuts":7,"Grapes":3,"Kiwi":3,"Melons":7,"Papaya":3,"Peaches":3,"Pears":7,"Artichokes":3,"Asparagus":3,"Beans":7,"Bok Choy":3,"Broccoli":3,"Brussels":3,"Cauliflower":7,"Cabbage":21,"Carrots":7,"Celery":1,"Corn":4,"Cucumbers":3,"Eggplant":7,"Garlic":7,"Ginger":1,"Leeks":7,"Lettuce":2,"Mushrooms":2,"Okra":60,"Onions":7,"Parsley":4,"Peppers":7,"Potatoes":10,"Radishes":14,"Rutabagas":4,"Squash":14,"Turnips":2,"Tomatoes":60,"Burritos":360,"Fish":120,"Guacamole":60,"Ice":180,"Pancakes":30,"Sausages":30,"Sherbet":360,"Tempeh":3,"Chicken":3,"Pate":21,"Cheese":7,"Cheesecake":180,"Biscuit":360,"Cornmeal":540,"Cornstarch":30,"Flour":300,"Frosting":540,"Chocolate":360,"Cocoa":360,"Ketchup":60,"Horseradish":360,"Mayonnaise":360,"Mustard":300,"Olives":360,"Pickles":60,"Salsa":180,"Crackers":180,"Extracts":540,"Gelatin":730,"Gravy":360,"Honey":120,"Jams":360,"Jerky":60,"Lentils":180,"Marshmallows":180,"Molasses":730,"Oils":730,"Nuts":360,"Peanut":60,"Peas":360,"Pectin":60,"Popcorn":180,"Pudding":240,"Rice":1095,"Sauce":1095,"Shortening":360,"Soda":90,"Soup":60,"Spaghetti":120,"Spices":360,"Paprika":360,"Sugar":540,"Syrup":730,"Tapioca":180,"Tea":360,"Vinegar":2,"Yeast":2,"Water":1,"Bread":30,"Cakes":3,"Cookies":1]

//Separate this function of populating the recipes array from the actual URL
    //that does the tasks and does the URLSession stuff
func populateRecipes() {
    for recipe in recipesToPopulate {
        createRecipe(recipe:recipe)
    }
        
}
    
    func createRecipe(recipe:String){
        //var recipeInstance: Recipe  = Recipe()
        self.recipes = [ ]
              
              let basic_url = "https://www.themealdb.com/api/json/v1/1/search.php?s=" + recipe
              
             let url = basic_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Recipe Not Available"
              let task = URLSession.shared.dataTask(with: URL(string: url)!)
                           { (data, response, error) in
                  guard let data = data else {
                    print("Error: No data to decode")
                    return
                  }
                
                  guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
                    print("Error: Couldn't decode data into a result")
                    return
                }

                let recipeInstance = Recipe(
                  id: result.meals[0].id,
                  strMeal: result.meals[0].strMeal,
                  strInstructions: result.meals[0].strInstructions,
                  strMealThumb: result.meals[0].strMealThumb,
                  strIngredient1: result.meals[0].strIngredient1,
                  strIngredient2: result.meals[0].strIngredient2,
                  strIngredient3: result.meals[0].strIngredient3,
                  strIngredient4: result.meals[0].strIngredient4,
                  strIngredient5: result.meals[0].strIngredient5,
                  strIngredient6: result.meals[0].strIngredient6,
                  strIngredient7: result.meals[0].strIngredient7,
                  strIngredient8: result.meals[0].strIngredient8,
                  strIngredient9: result.meals[0].strIngredient9,
                  strIngredient10: result.meals[0].strIngredient10,
                  strIngredient11: result.meals[0].strIngredient11,
                  strIngredient12: result.meals[0].strIngredient12,
                  strIngredient13: result.meals[0].strIngredient13,
                  strIngredient14: result.meals[0].strIngredient14,
                  strIngredient15: result.meals[0].strIngredient15,
                  strIngredient16: result.meals[0].strIngredient16,
                  strIngredient17: result.meals[0].strIngredient17,
                  strIngredient18: result.meals[0].strIngredient18,
                  strIngredient19: result.meals[0].strIngredient19,
                  strIngredient20: result.meals[0].strIngredient20,
                  strMeasure1: result.meals[0].strMeasure1,
                  strMeasure2: result.meals[0].strMeasure2,
                  strMeasure3: result.meals[0].strMeasure3,
                  strMeasure4: result.meals[0].strMeasure4,
                  strMeasure5: result.meals[0].strMeasure5,
                  strMeasure6: result.meals[0].strMeasure6,
                  strMeasure7: result.meals[0].strMeasure7,
                  strMeasure8: result.meals[0].strMeasure8,
                  strMeasure9: result.meals[0].strMeasure9,
                  strMeasure10: result.meals[0].strMeasure10,
                  strMeasure11: result.meals[0].strMeasure11,
                  strMeasure12: result.meals[0].strMeasure12,
                  strMeasure13: result.meals[0].strMeasure13,
                  strMeasure14: result.meals[0].strMeasure14,
                  strMeasure15: result.meals[0].strMeasure15,
                  strMeasure16: result.meals[0].strMeasure16,
                  strMeasure17: result.meals[0].strMeasure17,
                  strMeasure18: result.meals[0].strMeasure18,
                  strMeasure19: result.meals[0].strMeasure19,
                  strMeasure20: result.meals[0].strMeasure20
                );
                print(recipeInstance.strInstructions)
                self.recipes.append(recipeInstance)
              }
              task.resume()
          }
    
    func createMealIngRecipe () {
        // PROF H LOOK HERE!!!!!!!
        self.recipesIng.removeAll()
        for meal in self.mealIngredients {
            let recipe = meal.strMeal
            let basic_url = "https://www.themealdb.com/api/json/v1/1/search.php?s=" + recipe
            
           let url = basic_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Recipe Not Available"
            let task = URLSession.shared.dataTask(with: URL(string: url)!)
                         { (data, response, error) in
                guard let data = data else {
                  print("Error: No data to decode")
                  return
                }
              
                guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
                  print("Error: Couldn't decode data into a result")
                  return
              }

              let recipeInstance = Recipe(
                id: result.meals[0].id,
                strMeal: result.meals[0].strMeal,
                strInstructions: result.meals[0].strInstructions,
                strMealThumb: result.meals[0].strMealThumb,
                strIngredient1: result.meals[0].strIngredient1,
                strIngredient2: result.meals[0].strIngredient2,
                strIngredient3: result.meals[0].strIngredient3,
                strIngredient4: result.meals[0].strIngredient4,
                strIngredient5: result.meals[0].strIngredient5,
                strIngredient6: result.meals[0].strIngredient6,
                strIngredient7: result.meals[0].strIngredient7,
                strIngredient8: result.meals[0].strIngredient8,
                strIngredient9: result.meals[0].strIngredient9,
                strIngredient10: result.meals[0].strIngredient10,
                strIngredient11: result.meals[0].strIngredient11,
                strIngredient12: result.meals[0].strIngredient12,
                strIngredient13: result.meals[0].strIngredient13,
                strIngredient14: result.meals[0].strIngredient14,
                strIngredient15: result.meals[0].strIngredient15,
                strIngredient16: result.meals[0].strIngredient16,
                strIngredient17: result.meals[0].strIngredient17,
                strIngredient18: result.meals[0].strIngredient18,
                strIngredient19: result.meals[0].strIngredient19,
                strIngredient20: result.meals[0].strIngredient20,
                strMeasure1: result.meals[0].strMeasure1,
                strMeasure2: result.meals[0].strMeasure2,
                strMeasure3: result.meals[0].strMeasure3,
                strMeasure4: result.meals[0].strMeasure4,
                strMeasure5: result.meals[0].strMeasure5,
                strMeasure6: result.meals[0].strMeasure6,
                strMeasure7: result.meals[0].strMeasure7,
                strMeasure8: result.meals[0].strMeasure8,
                strMeasure9: result.meals[0].strMeasure9,
                strMeasure10: result.meals[0].strMeasure10,
                strMeasure11: result.meals[0].strMeasure11,
                strMeasure12: result.meals[0].strMeasure12,
                strMeasure13: result.meals[0].strMeasure13,
                strMeasure14: result.meals[0].strMeasure14,
                strMeasure15: result.meals[0].strMeasure15,
                strMeasure16: result.meals[0].strMeasure16,
                strMeasure17: result.meals[0].strMeasure17,
                strMeasure18: result.meals[0].strMeasure18,
                strMeasure19: result.meals[0].strMeasure19,
                strMeasure20: result.meals[0].strMeasure20
              );
              self.recipesIng.append(recipeInstance)
            }
            task.resume()
        }
    }
    
    func ingredientImages(ingredient: String) -> String{
        let url = "https://www.themealdb.com/images/ingredients/\(ingredient).png"
        return  url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Image Not Available"
        
    }
    
    func retrieveMealswithIng (ingredient: String){
      //PROF H LOOK HERE!!!!!
        let basic_url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=" + ingredient
        
        let url = basic_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Recipe Not Available"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!)
                     { (data, response, error) in
            guard let data = data else {
              print("Error: No data to decode")
              return
            }
            
          
            guard let result = try? JSONDecoder().decode(MealIngredientResult.self, from: data) else {
              print("Error: Couldn't decode data into a result")
              return
          }
            //prof h: there is a bug here
            
            self.mealIngredients.removeAll()
            
            for meal in result.meals {
                self.mealIngredients.append(MealIngredient(id:meal.id,strMeal: meal.strMeal, strMealThumb: meal.strMealThumb))
                self.createMealIngRecipe();
            }
        }
        task.resume()
    }
  
  func getIngExp(_ name: String,_ purchDate: Date) -> Date {
    var result: Date
    
    if let daysToExp = expiration_data.first(where: { (key, _) in key.range(of: name, options: .caseInsensitive) != nil }) {
      result = Calendar.current.date(byAdding: .day, value: daysToExp.value, to: purchDate)!
    } else {
      result = Date()
    }
    
    return result
  }
  
  func daysBetween(start: Date, end: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: start, to: end).day! + 1
  }

  func savePantryItem(name: String?, expiration: Date?, date: Date?) {
    // create a new Pantry Item object
    let newPantryItem = PantryItem()
    
    // add it to the `contacts` array
    if let nameTemp = name {
      if nameTemp != "" {
        newPantryItem.name = nameTemp
      } else {
        newPantryItem.name = nil
      }
    }
    if let expirationTemp = expiration as Date? {
      newPantryItem.expiration = expirationTemp
    } else {
      newPantryItem.expiration = nil
    }
    if let dateTemp = date as Date? {
        newPantryItem.date = dateTemp
      } else {
        newPantryItem.date = nil
      }
     
    let context = appDelegate.persistentContainer.viewContext
    let l = NSEntityDescription.entity(forEntityName: "Item", in: context)
    if let entity = l {
      let newItem = NSManagedObject(entity: entity, insertInto: context)
      newItem.setValue(newPantryItem.name, forKey: "name")
      newItem.setValue(newPantryItem.expiration, forKey: "expiration")
      newItem.setValue(newPantryItem.date, forKey: "date")
      do {
        try context.save()
      } catch {
        NSLog("[Contacts] ERROR: Failed to save PantryItem to CoreData with name: \(newPantryItem.displayName())")
      }
    self.pantry.append(newPantryItem)
    }
  }
  
  func fetchPantryItems() {
     let context = appDelegate.persistentContainer.viewContext
     let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
     request.returnsObjectsAsFaults = false
     do {
       let result = try context.fetch(request)
       for data in result as! [NSManagedObject] {
         let newPantryItem = PantryItem()
         newPantryItem.name = data.value(forKey: "name") as? String ?? ""
         newPantryItem.expiration = data.value(forKey: "expiration") as? Date
         newPantryItem.date = data.value(forKey: "date") as? Date
         pantry.append(newPantryItem)
         //NSLog("[PantryItems] loaded Pantry Item with name: \(data.value(forKey: "name") as! String) from CoreData")
       }
      
        pantry = pantry.sorted(by: { $0.expiration! < $1.expiration! })
     } catch {
       NSLog("[Pantry Items] ERROR: was unable to load Pantry Items from CoreData")
     }
   }
  
  func fetchItemsExpiringSoon() -> [PantryItem] {
    var expSoon: [PantryItem] = []
    
    for item in pantry {
      if daysBetween(start: Date(), end: item.expiration!) <= 5 {
        expSoon.append(item)
      }
    }
    
    return expSoon
  }
  
  func updatePantryItems() {
    pantry.removeAll()
    fetchPantryItems()
  }
  
  func deletePantryItem(atOffsets: IndexSet) {
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
    request.returnsObjectsAsFaults = false
    for index in atOffsets {
      let pantryItem: PantryItem = pantry[index]
      do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
          if ((pantryItem.name == data.value(forKey: "name") as? String) && (pantryItem.date == data.value(forKey: "date") as? Date))
           {
            context.delete(data)
            try context.save()
          }
        }
      } catch {
        print (error.localizedDescription)
      }
    }
    pantry.remove(atOffsets: atOffsets)
  }
  
  func saveMealItem(day_of_week: String?, name: String?, imageURL: String?, instructions: String?,
                    ingredient1: String?, ingredient2: String?, ingredient3: String?,
                    ingredient4: String?, ingredient5: String?, ingredient6: String?,
                    ingredient7: String?, ingredient8: String?, ingredient9: String?,
                    ingredient10: String?, ingredient11: String?, ingredient12: String?,
                    ingredient13: String?, ingredient14: String?, ingredient15: String?,
                    ingredient16: String?, ingredient17: String?, ingredient18: String?,
                    ingredient19: String?, ingredient20: String?,
                    measure1: String?, measure2: String?, measure3: String?,
                    measure4: String?, measure5: String?, measure6: String?,
                    measure7: String?, measure8: String?, measure9: String?,
                    measure10: String?, measure11: String?, measure12: String?,
                    measure13: String?, measure14: String?, measure15: String?,
                    measure16: String?, measure17: String?, measure18: String?,
                    measure19: String?, measure20: String?
  ) {
    // create a new Pantry Item object
    let newMealItem = MealItem()
    
    if let nameTemp = name {
      if nameTemp != "" {
        newMealItem.name = nameTemp
      } else {
        newMealItem.name = nil
      }
    }
    
    if let dayOfWeekTemp = day_of_week {
      if dayOfWeekTemp != "" {
        newMealItem.day_of_week = dayOfWeekTemp
      } else {
        newMealItem.day_of_week = nil
      }
    }
    
    if let imageURLTemp = imageURL {
      if imageURLTemp != "" {
        newMealItem.imageURL = imageURLTemp
      } else {
        newMealItem.imageURL = nil
      }
    }
     
    if let instructionsTemp = instructions {
      if instructionsTemp != "" {
        newMealItem.instructions = instructionsTemp
      } else {
        newMealItem.instructions = nil
      }
    }
    
    if let ingredient1Temp = ingredient1 {
      if ingredient1Temp != "" {
        newMealItem.ingredient1 = ingredient1Temp
      } else {
        newMealItem.ingredient1 = nil
      }
    }
    
    if let ingredient2Temp = ingredient2 {
      if ingredient2Temp != "" {
        newMealItem.ingredient2 = ingredient2Temp
      } else {
        newMealItem.ingredient2 = nil
      }
    }
    
    if let ingredient3Temp = ingredient3 {
      if ingredient3Temp != "" {
        newMealItem.ingredient3 = ingredient3Temp
      } else {
        newMealItem.ingredient3 = nil
      }
    }
    
    if let ingredient4Temp = ingredient4 {
      if ingredient4Temp != "" {
        newMealItem.ingredient4 = ingredient4Temp
      } else {
        newMealItem.ingredient4 = nil
      }
    }
    
    if let ingredient5Temp = ingredient5 {
      if ingredient5Temp != "" {
        newMealItem.ingredient5 = ingredient5Temp
      } else {
        newMealItem.ingredient5 = nil
      }
    }
    
    if let ingredient6Temp = ingredient6 {
      if ingredient6Temp != "" {
        newMealItem.ingredient6 = ingredient6Temp
      } else {
        newMealItem.ingredient6 = nil
      }
    }
    
    if let ingredient7Temp = ingredient7 {
      if ingredient7Temp != "" {
        newMealItem.ingredient7 = ingredient7Temp
      } else {
        newMealItem.ingredient7 = nil
      }
    }
    
    if let ingredient8Temp = ingredient8 {
      if ingredient8Temp != "" {
        newMealItem.ingredient8 = ingredient8Temp
      } else {
        newMealItem.ingredient8 = nil
      }
    }
    
    if let ingredient9Temp = ingredient9 {
      if ingredient9Temp != "" {
        newMealItem.ingredient9 = ingredient9Temp
      } else {
        newMealItem.ingredient9 = nil
      }
    }
    
    if let ingredient10Temp = ingredient10 {
      if ingredient10Temp != "" {
        newMealItem.ingredient10 = ingredient10Temp
      } else {
        newMealItem.ingredient10 = nil
      }
    }
     
    if let ingredient11Temp = ingredient11 {
      if ingredient11Temp != "" {
        newMealItem.ingredient11 = ingredient11Temp
      } else {
        newMealItem.ingredient11 = nil
      }
    }
    
    if let ingredient12Temp = ingredient12 {
      if ingredient12Temp != "" {
        newMealItem.ingredient12 = ingredient12Temp
      } else {
        newMealItem.ingredient12 = nil
      }
    }
    
    if let ingredient13Temp = ingredient13 {
      if ingredient13Temp != "" {
        newMealItem.ingredient13 = ingredient13Temp
      } else {
        newMealItem.ingredient13 = nil
      }
    }
    
    if let ingredient14Temp = ingredient14 {
      if ingredient14Temp != "" {
        newMealItem.ingredient14 = ingredient14Temp
      } else {
        newMealItem.ingredient14 = nil
      }
    }
    
    if let ingredient15Temp = ingredient15 {
      if ingredient15Temp != "" {
        newMealItem.ingredient15 = ingredient15Temp
      } else {
        newMealItem.ingredient15 = nil
      }
    }
    
    if let ingredient16Temp = ingredient16 {
      if ingredient16Temp != "" {
        newMealItem.ingredient16 = ingredient16Temp
      } else {
        newMealItem.ingredient16 = nil
      }
    }
    
    if let ingredient17Temp = ingredient17 {
      if ingredient17Temp != "" {
        newMealItem.ingredient17 = ingredient17Temp
      } else {
        newMealItem.ingredient17 = nil
      }
    }
    
    if let ingredient18Temp = ingredient18 {
      if ingredient18Temp != "" {
        newMealItem.ingredient18 = ingredient18Temp
      } else {
        newMealItem.ingredient18 = nil
      }
    }
    
    if let ingredient19Temp = ingredient19 {
      if ingredient19Temp != "" {
        newMealItem.ingredient19 = ingredient19Temp
      } else {
        newMealItem.ingredient19 = nil
      }
    }
    
    if let ingredient20Temp = ingredient20 {
      if ingredient20Temp != "" {
        newMealItem.ingredient20 = ingredient20Temp
      } else {
        newMealItem.ingredient20 = nil
      }
    }
    
    if let measure1Temp = measure1 {
      if measure1Temp != "" {
        newMealItem.measure1 = measure1Temp
      } else {
        newMealItem.measure1 = nil
      }
    }
    
    if let measure2Temp = measure2 {
      if measure2Temp != "" {
        newMealItem.measure2 = measure2Temp
      } else {
        newMealItem.measure2 = nil
      }
    }
    
    if let measure3Temp = measure3 {
      if measure3Temp != "" {
        newMealItem.measure3 = measure3Temp
      } else {
        newMealItem.measure3 = nil
      }
    }
    
    if let measure4Temp = measure4 {
      if measure4Temp != "" {
        newMealItem.measure4 = measure4Temp
      } else {
        newMealItem.measure4 = nil
      }
    }
    
    if let measure5Temp = measure5 {
      if measure5Temp != "" {
        newMealItem.measure5 = measure5Temp
      } else {
        newMealItem.measure5 = nil
      }
    }
    
    if let measure6Temp = measure6 {
      if measure6Temp != "" {
        newMealItem.measure6 = measure6Temp
      } else {
        newMealItem.measure6 = nil
      }
    }
    
    if let measure7Temp = measure7 {
      if measure7Temp != "" {
        newMealItem.measure7 = measure7Temp
      } else {
        newMealItem.measure7 = nil
      }
    }
    
    if let measure8Temp = measure8 {
      if measure8Temp != "" {
        newMealItem.measure8 = measure8Temp
      } else {
        newMealItem.measure8 = nil
      }
    }
    
    if let measure9Temp = measure9 {
      if measure9Temp != "" {
        newMealItem.measure9 = measure9Temp
      } else {
        newMealItem.measure9 = nil
      }
    }
    
    if let measure10Temp = measure10 {
      if measure10Temp != "" {
        newMealItem.measure10 = measure10Temp
      } else {
        newMealItem.measure10 = nil
      }
    }
    
    if let measure11Temp = measure11 {
      if measure11Temp != "" {
        newMealItem.measure11 = measure11Temp
      } else {
        newMealItem.measure11 = nil
      }
    }
    
    if let measure12Temp = measure12 {
      if measure12Temp != "" {
        newMealItem.measure12 = measure12Temp
      } else {
        newMealItem.measure12 = nil
      }
    }
     
    
    if let measure13Temp = measure13 {
      if measure13Temp != "" {
        newMealItem.measure13 = measure13Temp
      } else {
        newMealItem.measure13 = nil
      }
    }
    
    if let measure14Temp = measure14 {
      if measure14Temp != "" {
        newMealItem.measure14 = measure14Temp
      } else {
        newMealItem.measure14 = nil
      }
    }
    
    if let measure15Temp = measure15 {
      if measure15Temp != "" {
        newMealItem.measure15 = measure15Temp
      } else {
        newMealItem.measure15 = nil
      }
    }
    
    if let measure16Temp = measure16 {
      if measure16Temp != "" {
        newMealItem.measure16 = measure16Temp
      } else {
        newMealItem.measure16 = nil
      }
    }
    
    if let measure17Temp = measure17 {
      if measure17Temp != "" {
        newMealItem.measure17 = measure17Temp
      } else {
        newMealItem.measure17 = nil
      }
    }
    
    if let measure18Temp = measure18 {
      if measure18Temp != "" {
        newMealItem.measure18 = measure18Temp
      } else {
        newMealItem.measure18 = nil
      }
    }
    
    if let measure19Temp = measure19 {
      if measure19Temp != "" {
        newMealItem.measure19 = measure19Temp
      } else {
        newMealItem.measure19 = nil
      }
    }
    
    if let measure20Temp = measure20 {
      if measure20Temp != "" {
        newMealItem.measure20 = measure20Temp
      } else {
        newMealItem.measure20 = nil
      }
    }
     
    let context = appDelegate.persistentContainer.viewContext
    let l = NSEntityDescription.entity(forEntityName: "Meal", in: context)
    if let entity = l {
      let newItem = NSManagedObject(entity: entity, insertInto: context)
      newItem.setValue(newMealItem.day_of_week, forKey: "day_of_week")
      newItem.setValue(newMealItem.name, forKey: "name")
      newItem.setValue(newMealItem.imageURL, forKey: "imageURL")
      newItem.setValue(newMealItem.id, forKey: "id")
      newItem.setValue(newMealItem.instructions, forKey: "instructions")
      newItem.setValue(newMealItem.ingredient1, forKey: "ingredient1")
      newItem.setValue(newMealItem.ingredient2, forKey: "ingredient2")
      newItem.setValue(newMealItem.ingredient3, forKey: "ingredient3")
      newItem.setValue(newMealItem.ingredient4, forKey: "ingredient4")
      newItem.setValue(newMealItem.ingredient5, forKey: "ingredient5")
      newItem.setValue(newMealItem.ingredient6, forKey: "ingredient6")
      newItem.setValue(newMealItem.ingredient7, forKey: "ingredient7")
      newItem.setValue(newMealItem.ingredient8, forKey: "ingredient8")
      newItem.setValue(newMealItem.ingredient9, forKey: "ingredient9")
      newItem.setValue(newMealItem.ingredient10, forKey: "ingredient10")
      newItem.setValue(newMealItem.ingredient11, forKey: "ingredient11")
      newItem.setValue(newMealItem.ingredient12, forKey: "ingredient12")
      newItem.setValue(newMealItem.ingredient13, forKey: "ingredient13")
      newItem.setValue(newMealItem.ingredient14, forKey: "ingredient14")
      newItem.setValue(newMealItem.ingredient15, forKey: "ingredient15")
      newItem.setValue(newMealItem.ingredient16, forKey: "ingredient16")
      newItem.setValue(newMealItem.ingredient17, forKey: "ingredient17")
      newItem.setValue(newMealItem.ingredient18, forKey: "ingredient18")
      newItem.setValue(newMealItem.ingredient19, forKey: "ingredient19")
      newItem.setValue(newMealItem.ingredient20, forKey: "ingredient20")
      newItem.setValue(newMealItem.measure1, forKey: "measure1")
      newItem.setValue(newMealItem.measure2, forKey: "measure2")
      newItem.setValue(newMealItem.measure3, forKey: "measure3")
      newItem.setValue(newMealItem.measure4, forKey: "measure4")
      newItem.setValue(newMealItem.measure5, forKey: "measure5")
      newItem.setValue(newMealItem.measure6, forKey: "measure6")
      newItem.setValue(newMealItem.measure7, forKey: "measure7")
      newItem.setValue(newMealItem.measure8, forKey: "measure8")
      newItem.setValue(newMealItem.measure9, forKey: "measure9")
      newItem.setValue(newMealItem.measure10, forKey: "measure10")
      newItem.setValue(newMealItem.measure11, forKey: "measure11")
      newItem.setValue(newMealItem.measure12, forKey: "measure12")
      newItem.setValue(newMealItem.measure13, forKey: "measure13")
      newItem.setValue(newMealItem.measure14, forKey: "measure14")
      newItem.setValue(newMealItem.measure15, forKey: "measure15")
      newItem.setValue(newMealItem.measure16, forKey: "measure16")
      newItem.setValue(newMealItem.measure17, forKey: "measure17")
      newItem.setValue(newMealItem.measure18, forKey: "measure18")
      newItem.setValue(newMealItem.measure19, forKey: "measure19")
      newItem.setValue(newMealItem.measure20, forKey: "measure20")
      do {
        try context.save()
      } catch {
        NSLog("[Meals] ERROR: Failed to save MealItem to CoreData with name: \(newMealItem.displayName())")
      }
    self.meals.append(newMealItem)
    }
  }
  
  func fetchMealItems() {
     let context = appDelegate.persistentContainer.viewContext
     let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Meal")
     request.returnsObjectsAsFaults = false
     do {
       let result = try context.fetch(request)
       for data in result as! [NSManagedObject] {
         let newMealItem = MealItem()
         newMealItem.day_of_week = data.value(forKey: "day_of_week") as? String ?? ""
         newMealItem.name = data.value(forKey: "name") as? String ?? ""
         newMealItem.imageURL = data.value(forKey: "imageURL") as? String ?? ""
         newMealItem.id = data.value(forKey: "id") as? String ?? ""
         newMealItem.instructions = data.value(forKey: "instructions") as? String ?? ""
         newMealItem.ingredient1 = data.value(forKey: "ingredient1") as? String ?? ""
         newMealItem.ingredient2 = data.value(forKey: "ingredient2") as? String ?? ""
         newMealItem.ingredient3 = data.value(forKey: "ingredient3") as? String ?? ""
         newMealItem.ingredient4 = data.value(forKey: "ingredient4") as? String ?? ""
         newMealItem.ingredient5 = data.value(forKey: "ingredient5") as? String ?? ""
        newMealItem.ingredient6 = data.value(forKey: "ingredient6") as? String ?? ""
        newMealItem.ingredient7 = data.value(forKey: "ingredient7") as? String ?? ""
        newMealItem.ingredient8 = data.value(forKey: "ingredient8") as? String ?? ""
        newMealItem.ingredient9 = data.value(forKey: "ingredient9") as? String ?? ""
        newMealItem.ingredient10 = data.value(forKey: "ingredient10") as? String ?? ""
        newMealItem.ingredient11 = data.value(forKey: "ingredient11") as? String ?? ""
        newMealItem.ingredient12 = data.value(forKey: "ingredient12") as? String ?? ""
        newMealItem.ingredient13 = data.value(forKey: "ingredient13") as? String ?? ""
        newMealItem.ingredient14 = data.value(forKey: "ingredient14") as? String ?? ""
        newMealItem.ingredient15 = data.value(forKey: "ingredient15") as? String ?? ""
        newMealItem.ingredient16 = data.value(forKey: "ingredient16") as? String ?? ""
        newMealItem.ingredient17 = data.value(forKey: "ingredient17") as? String ?? ""
        newMealItem.ingredient18 = data.value(forKey: "ingredient18") as? String ?? ""
        newMealItem.ingredient19 = data.value(forKey: "ingredient19") as? String ?? ""
        newMealItem.ingredient20 = data.value(forKey: "ingredient20") as? String ?? ""
        newMealItem.measure1 = data.value(forKey: "measure1") as? String ?? ""
        newMealItem.measure2 = data.value(forKey: "measure2") as? String ?? ""
        newMealItem.measure3 = data.value(forKey: "measure3") as? String ?? ""
        newMealItem.measure4 = data.value(forKey: "measure4") as? String ?? ""
        newMealItem.measure5 = data.value(forKey: "measure5") as? String ?? ""
        newMealItem.measure6 = data.value(forKey: "measure6") as? String ?? ""
        newMealItem.measure7 = data.value(forKey: "measure7") as? String ?? ""
        newMealItem.measure8 = data.value(forKey: "measure8") as? String ?? ""
        newMealItem.measure9 = data.value(forKey: "measure9") as? String ?? ""
        newMealItem.measure10 = data.value(forKey: "measure10") as? String ?? ""
        newMealItem.measure11 = data.value(forKey: "measure11") as? String ?? ""
        newMealItem.measure12 = data.value(forKey: "measure12") as? String ?? ""
        newMealItem.measure13 = data.value(forKey: "measure13") as? String ?? ""
        newMealItem.measure14 = data.value(forKey: "measure14") as? String ?? ""
        newMealItem.measure15 = data.value(forKey: "measure15") as? String ?? ""
        newMealItem.measure16 = data.value(forKey: "measure16") as? String ?? ""
        newMealItem.measure17 = data.value(forKey: "measure17") as? String ?? ""
        newMealItem.measure18 = data.value(forKey: "measure18") as? String ?? ""
        newMealItem.measure19 = data.value(forKey: "measure19") as? String ?? ""
        newMealItem.measure20 = data.value(forKey: "measure20") as? String ?? ""
        
        
         meals.append(newMealItem)
       }
     } catch {
       NSLog("[Meal Items] ERROR: was unable to load Meal Items from CoreData")
     }
   }
  
  func updateMealItems() {
    meals.removeAll()
    fetchMealItems()
  }
  
  
//  func deleteMealItem(atOffsets: IndexSet) {
//    let context = appDelegate.persistentContainer.viewContext
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Meal")
//    request.returnsObjectsAsFaults = false
//    for index in atOffsets {
//      let mealItem: MealItem = meals[index]
//      do {
//        let result = try context.fetch(request)
//        for data in result as! [NSManagedObject] {
//          if ((mealItem.imageURL == data.value(forKey: "imageURL") as? String)
//              && (mealItem.name == data.value(forKey: "name") as? String)
//              && (mealItem.day_of_week == data.value(forKey: "day_of_week") as? String)
//          )
//           {
//            context.delete(data)
//            try context.save()
//          }
//        }
//      } catch {
//        print (error.localizedDescription)
//      }
//    }
//    meals.remove(atOffsets: atOffsets)
//  }
  
  func deleteMealItem(mealItem: MealItem) {
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Meal")
    request.returnsObjectsAsFaults = false

      do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
          if ((mealItem.id == data.value(forKey: "id") as? String)) {
            context.delete(data)
            try context.save()
          }
        }
      } catch {
        print (error.localizedDescription)
      }

    meals.remove(at: meals.firstIndex(of: mealItem) ?? -1)
  }
}
