//
//  Pantry.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import Foundation
import SwiftUI

class PantryItem: Identifiable, Equatable {
  
  
  // MARK: Properties
  var name: String?
  var expiration: Date?
  var date: Date?


  init(name: String? = nil, expiration: Date? = nil, date: Date? = nil) {
    self.name = name
    self.expiration = expiration
    self.date = date
  }

  func displayName() -> String {
    return name ?? "n/a"
  }
  
  func displayDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YY"
    return dateFormatter.string(from: date ?? Date())
  }
  
  func displayExpDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YY"
    return dateFormatter.string(from: expiration ?? Date())
  }
  
  func displayExpDays() -> String {
    let days = Calendar.current.dateComponents([.day], from: Date(), to: expiration!).day! + 1
    
    if days == 1 {
      return "Expires in \(days) day"
    }
    
    return "Expires in \(days) days"
  }
  
  static func == (lhs: PantryItem, rhs: PantryItem) -> Bool {
    return lhs.displayName() == rhs.displayName()
        && lhs.displayExpDate() == rhs.displayExpDate()
        && lhs.displayDate() == rhs.displayDate()
  }
}

struct MealIngredient: Hashable, Codable, Identifiable {
    //var id: ObjectIdentifier
    //var idMeal: ObjectIdentifier
    var id: String
    let strMeal: String
    let strMealThumb: String
    enum CodingKeys: String, CodingKey {
        //case idMeal
        case id = "idMeal"
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
