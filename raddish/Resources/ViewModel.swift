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
  var recipesToPopulate = ["Arrabiata", "Soup", "sandwich", "salad"]
  var expiration_data = ["Juice":21.0,"Butter":30.0,"Buttermilk":7.0,"Parmesan":30.0,"Cream":3.0,"Eggnog":3.0,"Eggs":21.0,"Kefir":7.0,"Milk":7.0,"Yogurt":7.0,"Tofu":7.0,"Caviar":7.0,"Surimi":3.0,"Shrimp":1.0,"Crab":1.0,"Lobster":1.0,"Beef":3.0,"Giblets":21.0,"Apples":2.0,"Apricots":3.0,"Avocados":2.0,"Bananas":1.0,"Berries":7.0,"Coconuts":7.0,"Grapes":3.0,"Kiwi":3.0,"Melons":7.0,"Papaya":3.0,"Peaches":3.0,"Pears":7.0,"Artichokes":3.0,"Asparagus":3.0,"Beans":7.0,"Bok Choi":3.0,"Broccoli":3.0,"Brussels":3.0,"Cauliflower":7.0,"Cabbage":21.0,"Carrots":7.0,"Celery":1.0,"Corn":4.0,"Cucumbers":3.0,"Eggplant":7.0,"Garlic":7.0,"Ginger":1.0,"Leeks":7.0,"Lettuce":2.0,"Mushrooms":2.0,"Okra":60.0,"Onions":7.0,"Parsley":4.0,"Peppers":7.0,"Potatoes":10.0,"Radishes":14.0,"Rutabagas":4.0,"Squash":14.0,"Turnips":2.0,"Tomatoes":60.0,"Burritos":360.0,"Fish":120.0,"Guacamole":60.0,"Ice":180.0,"Pancakes":30.0,"Sausages":30.0,"Sherbet":360.0,"Tempeh":3.0,"Chicken":3.0,"Pate":21.0,"Cheese":7.0,"Cheesecake":180.0,"Biscuit":360.0,"Cornmeal":540.0,"Cornstarch":30.0,"Flour":300.0,"Frosting":540.0,"Chocolate":360.0,"Cocoa":360.0,"Ketchup":60.0,"Horseradish":360.0,"Mayonnaise":360.0,"Mustard":300.0,"Olives":360.0,"Pickles":60.0,"Salsa":180.0,"Crackers":180.0,"Extracts":540.0,"Gelatin":730.0,"Gravy":360.0,"Honey":120.0,"Jams":360.0,"Jerky":60.0,"Lentils":180.0,"Marshmallows":180.0,"Molasses":730.0,"Oils":730.0,"Nuts":360.0,"Peanut":60.0,"Peas":360.0,"Pectin":60.0,"Popcorn":180.0,"Pudding":240.0,"Rice":1095.0,"Sauce":1095.0,"Shortening":360.0,"Soda":90.0,"Soup":60.0,"Spaghetti":120.0,"Spices":360.0,"Paprika":360.0,"Sugar":540.0,"Syrup":730.0,"Tapioca":180.0,"Tea":360.0,"Vinegar":2.0,"Yeast":2.0,"Water":1.0,"Bread":30.0,"Cakes":3.0,"Cookies":1.0]
  
  func populateRecipes() {
    self.recipes = [ ]
    for recipe in recipesToPopulate {
      
      let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=" + recipe
      
      let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
          guard let data = data else {
            print("Error: No data to decode")
            return
          }
        
          guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
            print("Error: Couldn't decode data into a result")
            return
        }

        let recipeInstance = Recipe(strMeal: result.meals[0].strMeal, strInstructions: result.meals[0].strInstructions, strMealThumb: result.meals[0].strMealThumb);
        print(recipeInstance.strInstructions)
        self.recipes.append(recipeInstance)

      }
      task.resume()
    }
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
    if let expirationTemp = expiration {
      if let expirationTemp = date as Date? {
        newPantryItem.expiration = expirationTemp
      } else {
        newPantryItem.expiration = nil
      }
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
     } catch {
       NSLog("[Pantry Items] ERROR: was unable to load Pantry Items from CoreData")
     }
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
