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

struct MealIngredient: Hashable, Codable {
    let strMeal: String
    let strInstructions: String
    let idMeal: String
  }

struct MealIngredientResult: Decodable {
  var mealIngredient: [MealIngredient]
  
  
  enum CodingKeys : String, CodingKey {
    case mealIngredient
    
  }
  
}
