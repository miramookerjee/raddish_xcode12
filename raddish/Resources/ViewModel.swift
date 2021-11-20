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
  var recipesToPopulate = ["Arrabiata", "Soup", "sandwich", "salad"]
  
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

  func savePantryItem(name: String?, expiration: NSDate?, date: Date?) {
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
      if let expirationTemp = date as NSDate? {
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
         newPantryItem.expiration = data.value(forKey: "expiration") as? NSDate
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
