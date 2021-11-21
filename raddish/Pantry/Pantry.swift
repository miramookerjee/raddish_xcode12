//
//  Pantry.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import Foundation
import SwiftUI

class PantryItem: Identifiable {
  
  // MARK: Properties
  var name: String?
  var expiration: NSDate?
  var date: Date?


  init(name: String? = nil, expiration: NSDate? = nil, date: Date? = nil) {
    self.name = name
    self.expiration = expiration
    self.date = date
  }

  func displayName() -> String {
    return name ?? "n/a"
  }
}

struct MealIngredient: Hashable, Codable, Identifiable {
    //var id: ObjectIdentifier
    //var idMeal: ObjectIdentifier
    let strMeal: String
    let strMealThumb: String
    enum CodingKeys: String, CodingKey {
        //case idMeal
        case strMeal
        case strMealThumb
    }
  }

struct MealIngredientResult: Decodable {
  var meals: [MealIngredient]
  
  
  enum CodingKeys : String, CodingKey {
    case meals
    
  }
  
}
