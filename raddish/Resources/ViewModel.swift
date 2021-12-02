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
  
    func populateRecipes() {
        self.recipes = [ ]
        for recipe in recipesToPopulate {
            let recipeInstance = createRecipe(recipe: recipe)
            self.recipes.append(recipeInstance)
        }
      }
    
    func createRecipe(recipe:String) -> Recipe {
//          var recipeInstance = Recipe(strInstructions: "Make the sandwich", strMealThumb: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
//               strIngredient1:"Chicken Breast",strIngredient2:"Pickle Juice",strIngredient3:"Egg",strIngredient4:"Milk",strIngredient5:"Flour",strIngredient6:"Icing Sugar",strIngredient7:"Paprika",strIngredient8:"Salt",strIngredient9:"Black Pepper",strIngredient10:"Garlic Powder",strIngredient11:"Celery Salt",strIngredient12:"Cayenne Pepper",strIngredient13:"Olive Oil",strIngredient14:"Sesame Seed Burger Buns",strIngredient15:"",strIngredient16:"",strIngredient17:"",strIngredient18:"",strIngredient19:"",strIngredient20:"",strMeasure1:"1",strMeasure2:"1/4 cup",strMeasure3:"1",strMeasure4:"1/4 cup",strMeasure5:"1/2 cup ",strMeasure6:"1 tbs",strMeasure7:"1/2 tsp",strMeasure8:"1/2 tsp",strMeasure9:"1/4 tsp",strMeasure10:"1/4 tsp",strMeasure11:"1/4 tsp",strMeasure12:"1/2 tsp",strMeasure13:"1 cup ",strMeasure14:"1",strMeasure15:" ",strMeasure16:" ",strMeasure17:" ",strMeasure18:" ",strMeasure19:" ",strMeasure20:" ")
        
            //var recipeInstance = Recipe(strInstructions: "Make the sandwich", strMealThumb: //"https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
                                        //               strIngredient1:"Chicken Breast",strIngredient2:"Pickle Juice",strIngredient3:"Egg",strIngredient4:"Milk",strIngredient5:"Flour",strIngredient6:"Icing Sugar",strIngredient7:"Paprika",strIngredient8:"Salt",strIngredient9:"Black Pepper",strIngredient10:"Garlic Powder",strIngredient11:"Celery Salt",strIngredient12:"Cayenne Pepper",strIngredient13:"Olive Oil",strIngredient14:"Sesame Seed Burger Buns",strIngredient15:"",strIngredient16:"",strIngredient17:"",strIngredient18:"",strIngredient19:"",strIngredient20:"",strMeasure1:"1",strMeasure2:"1/4 cup",strMeasure3:"1",strMeasure4:"1/4 cup",strMeasure5:"1/2 cup ",strMeasure6:"1 tbs",strMeasure7:"1/2 tsp",strMeasure8:"1/2 tsp",strMeasure9:"1/4 tsp",strMeasure10:"1/4 tsp",strMeasure11:"1/4 tsp",strMeasure12:"1/2 tsp",strMeasure13:"1 cup ",strMeasure14:"1",strMeasure15:" ",strMeasure16:" ",strMeasure17:" ",strMeasure18:" ",strMeasure19:" ",strMeasure20:" ")
            
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
              recipeInstance = Recipe(strMeal: result.meals[0].strMeal, strInstructions: result.meals[0].strInstructions, strMealThumb: result.meals[0].strMealThumb,
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
                   strMeasure20: result.meals[0].strMeasure20);

              }
              task.resume()
              return recipeInstance;

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
  
    func saveMealItem(day_of_week: String?, name: String?, imageURL: String?, missing_ing: Bool) {
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
    
    //Compare all the ingredients in the Pantry with the
    //ingredients required for this meal
        
    let recipe = createRecipe(recipe: newMealItem.name)
    for pantryItem in self.pantry {
            
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
          if ((mealItem.imageURL == data.value(forKey: "imageURL") as? String)
              && (mealItem.name == data.value(forKey: "name") as? String)
              && (mealItem.day_of_week == data.value(forKey: "day_of_week") as? String)
              && (mealItem.id == data.value(forKey: "id") as? UUID)
          )
           {
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
