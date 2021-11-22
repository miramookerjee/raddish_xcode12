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
  @Published var meals = [MealItem]()
  @Published var mealIngredients = [MealIngredient]()
  @Published var recipesIngExpSoon = [Recipe]()
  var recipesToPopulate = ["Arrabiata", "Soup", "sandwich", "salad", "chicken"]
  var expiration_data = ["Juice":21,"Butter":30,"Buttermilk":7,"Parmesan":30,"Cream":3,"Eggnog":3,"Eggs":21,"Kefir":7,"Milk":7,"Yogurt":7,"Tofu":7,"Caviar":7,"Surimi":3,"Shrimp":1,"Crab":1,"Lobster":1,"Beef":3,"Giblets":21,"Apples":2,"Apricots":3,"Avocados":2,"Bananas":1,"Berries":7,"Coconuts":7,"Grapes":3,"Kiwi":3,"Melons":7,"Papaya":3,"Peaches":3,"Pears":7,"Artichokes":3,"Asparagus":3,"Beans":7,"Bok Choy":3,"Broccoli":3,"Brussels":3,"Cauliflower":7,"Cabbage":21,"Carrots":7,"Celery":1,"Corn":4,"Cucumbers":3,"Eggplant":7,"Garlic":7,"Ginger":1,"Leeks":7,"Lettuce":2,"Mushrooms":2,"Okra":60,"Onions":7,"Parsley":4,"Peppers":7,"Potatoes":10,"Radishes":14,"Rutabagas":4,"Squash":14,"Turnips":2,"Tomatoes":60,"Burritos":360,"Fish":120,"Guacamole":60,"Ice":180,"Pancakes":30,"Sausages":30,"Sherbet":360,"Tempeh":3,"Chicken":3,"Pate":21,"Cheese":7,"Cheesecake":180,"Biscuit":360,"Cornmeal":540,"Cornstarch":30,"Flour":300,"Frosting":540,"Chocolate":360,"Cocoa":360,"Ketchup":60,"Horseradish":360,"Mayonnaise":360,"Mustard":300,"Olives":360,"Pickles":60,"Salsa":180,"Crackers":180,"Extracts":540,"Gelatin":730,"Gravy":360,"Honey":120,"Jams":360,"Jerky":60,"Lentils":180,"Marshmallows":180,"Molasses":730,"Oils":730,"Nuts":360,"Peanut":60,"Peas":360,"Pectin":60,"Popcorn":180,"Pudding":240,"Rice":1095,"Sauce":1095,"Shortening":360,"Soda":90,"Soup":60,"Spaghetti":120,"Spices":360,"Paprika":360,"Sugar":540,"Syrup":730,"Tapioca":180,"Tea":360,"Vinegar":2,"Yeast":2,"Water":1,"Bread":30,"Cakes":3,"Cookies":1]

//Separate this function of populating the recipes array from the actual URL
    //that does the tasks and does the URLSession stuff
func populateRecipes() {
    self.recipes = [ ]
    for recipe in recipesToPopulate {
      
      let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=" + recipe
      
      let task = URLSession.shared.dataTask(with: URL(string: url)!)
                   { (data, response, error) in
          guard let data = data else {
            print("Error: No data to decode")
            return
          }
        
          guard let result = try? JSONDecoder().decode(RecipeResult.self, from: data) else {
            print("Error: Couldn't decode data into a result")
            return
        }

        let recipeInstance = Recipe(strMeal: result.meals[0].strMeal, strInstructions: result.meals[0].strInstructions, strMealThumb: result.meals[0].strMealThumb);
        self.recipes.append(recipeInstance)

      }
      task.resume()
    }
  
    print(self.recipes)
  }
  
  func populateRecipesIngExpSoon() {
    self.recipesIngExpSoon = [ ]
    let itemsExpSoon = fetchItemsExpiringSoon()
    print(itemsExpSoon)
    var ingExpSoon: [String] = []
    
    for item in itemsExpSoon {
      let cleanName = cleanIngNameForAPI(ing: item.name!)
      ingExpSoon.append(cleanName)
    }
    
    print(ingExpSoon)
    
    var recipeIDs: [String] = []
    
    for ingredient in ingExpSoon {
      
      let url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=" + ingredient
      
      let task = URLSession.shared.dataTask(with: URL(string: url)!)
                   { (data, response, error) in
          guard let data = data else {
            print("Error: No data to decode")
            return
          }
        
          guard let result = try? JSONDecoder().decode(RecipeIDResult.self, from: data) else {
            print("Error: Couldn't decode data into a result")
            return
        }
        recipeIDs.append(result.meals[0].idMeal)
      }
      task.resume()
    }
    
    print(recipeIDs)
  
    for id in recipeIDs {
      
      let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id
      
      let task = URLSession.shared.dataTask(with: URL(string: url)!)
                   { (data, response, error) in
          guard let data = data else {
            print("Error: No data to decode")
            return
          }
        
          guard let result = try? JSONDecoder().decode(RecipeResult.self, from: data) else {
            print("Error: Couldn't decode data into a result")
            return
        }

        let recipeInstance = Recipe(strMeal: result.meals[0].strMeal, strInstructions: result.meals[0].strInstructions, strMealThumb: result.meals[0].strMealThumb);
        self.recipesIngExpSoon.append(recipeInstance)

      }
      task.resume()
    }
    
    print(self.recipesIngExpSoon)
  }
  
  private func cleanIngNameForAPI(ing: String) -> String {
    var result = ""
    
    for c in ing.lowercased() {
      if c == " " {
        result.append("_")
      } else {
        result.append(c)
      }
    }
    
    return result
  }
    
    func ingredientImages(ingredient: String) -> String{
        let url = "https://www.themealdb.com/images/ingredients/\(ingredient).png"
        return  url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Image Not Available"
        
    }
    
    func retrieveMealswithIng (ingredient: String){
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=" + ingredient
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
            
            for meal in result.meals {
                self.mealIngredients.append(MealIngredient(strMeal: meal.strMeal, strMealThumb: meal.strMealThumb))
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
    
    print(expSoon)
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
  
  func saveMealItem(day_of_week: String?, name: String?, imageURL: String?) {
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
     
    let context = appDelegate.persistentContainer.viewContext
    let l = NSEntityDescription.entity(forEntityName: "Meal", in: context)
    if let entity = l {
      let newItem = NSManagedObject(entity: entity, insertInto: context)
      newItem.setValue(newMealItem.day_of_week, forKey: "day_of_week")
      newItem.setValue(newMealItem.name, forKey: "name")
      newItem.setValue(newMealItem.imageURL, forKey: "imageURL")
      newItem.setValue(newMealItem.id, forKey: "id")
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
