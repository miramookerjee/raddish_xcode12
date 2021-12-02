//
//  Meal.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/2/21.
//

import Foundation
import SwiftUI

class MealItem: Identifiable, Hashable {
  
  // MARK: Properties
  var day_of_week: String?
  var name: String?
  var imageURL: String?
  var id = UUID().uuidString
  var instructions: String?
  var ingredient1: String?
  var ingredient2: String?
  var ingredient3: String?
  var ingredient4: String?
  var ingredient5: String?
  var ingredient6: String?
  var ingredient7: String?
  var ingredient8: String?
  var ingredient9: String?
  var ingredient10: String?
  var ingredient11: String?
  var ingredient12: String?
  var ingredient13: String?
  var ingredient14: String?
  var ingredient15: String?
  var ingredient16: String?
  var ingredient17: String?
  var ingredient18: String?
  var ingredient19: String?
  var ingredient20: String?
  var measure1: String?
  var measure2: String?
  var measure3: String?
  var measure4: String?
  var measure5: String?
  var measure6: String?
  var measure7: String?
  var measure8: String?
  var measure9: String?
  var measure10: String?
  var measure11: String?
  var measure12: String?
  var measure13: String?
  var measure14: String?
  var measure15: String?
  var measure16: String?
  var measure17: String?
  var measure18: String?
  var measure19: String?
  var measure20: String?
  var missingIng: Bool


  init(day_of_week: String? = nil, name: String? = nil,
       imageURL: String? = nil, instructions: String? = nil,
       ingredient1: String? = nil, ingredient2: String? = nil, ingredient3: String? = nil,
       ingredient4: String? = nil, ingredient5: String? = nil, ingredient6: String? = nil,
       ingredient7: String? = nil, ingredient8: String? = nil, ingredient9: String? = nil,
       ingredient10: String? = nil, ingredient11: String? = nil, ingredient12: String? = nil,
       ingredient13: String? = nil, ingredient14: String? = nil, ingredient15: String? = nil,
       ingredient16: String? = nil, ingredient17: String? = nil, ingredient18: String? = nil,
       ingredient19: String? = nil, ingredient20: String? = nil,
       measure1: String? = nil, measure2: String? = nil, measure3: String? = nil,
       measure4: String? = nil, measure5: String? = nil, measure6: String? = nil,
       measure7: String? = nil, measure8: String? = nil, measure9: String? = nil,
       measure10: String? = nil, measure11: String? = nil, measure12: String? = nil,
       measure13: String? = nil, measure14: String? = nil, measure15: String? = nil,
       measure16: String? = nil, measure17: String? = nil, measure18: String? = nil,
       measure19: String? = nil, measure20: String? = nil, missingIng: Bool = false
  ) {
    self.day_of_week = day_of_week
    self.name = name
    self.imageURL = imageURL
    self.instructions = instructions
    self.ingredient1 = ingredient1
    self.ingredient2 = ingredient2
    self.ingredient3 = ingredient3
    self.ingredient4 = ingredient4
    self.ingredient5 = ingredient5
    self.ingredient6 = ingredient6
    self.ingredient7 = ingredient7
    self.ingredient8 = ingredient8
    self.ingredient9 = ingredient9
    self.ingredient10 = ingredient10
    self.ingredient11 = ingredient11
    self.ingredient12 = ingredient12
    self.ingredient13 = ingredient13
    self.ingredient14 = ingredient14
    self.ingredient15 = ingredient15
    self.ingredient16 = ingredient16
    self.ingredient17 = ingredient17
    self.ingredient18 = ingredient18
    self.ingredient19 = ingredient19
    self.ingredient20 = ingredient20
    self.measure1 = measure1
    self.measure2 = measure2
    self.measure3 = measure3
    self.measure4 = measure4
    self.measure5 = measure5
    self.measure6 = measure6
    self.measure7 = measure7
    self.measure8 = measure8
    self.measure9 = measure9
    self.measure10 = measure10
    self.measure11 = measure11
    self.measure12 = measure12
    self.measure13 = measure13
    self.measure14 = measure14
    self.measure15 = measure15
    self.measure16 = measure16
    self.measure17 = measure17
    self.measure18 = measure18
    self.measure19 = measure19
    self.measure20 = measure20
    self.missingIng = false; 
  }

  func displayName() -> String {
    return name ?? "n/a"
  }
  
  func displayDayOfWeek() -> String {
    return day_of_week ?? "n/a"
  }

  func displayimageURL() -> String {
    return imageURL ?? "n/a"
  }
  
  func displayInstructions() -> String {
    return instructions ?? "n/a"
  }
  
  func displayIngredient1() -> String {
    return ingredient1 ?? ""
  }
  
  func displayIngredient2() -> String {
    return ingredient2 ?? ""
  }
  
  func displayIngredient3() -> String {
    return ingredient3 ?? ""
  }
  
  func displayIngredient4() -> String {
    return ingredient4 ?? ""
  }
  
  func displayIngredient5() -> String {
    return ingredient5 ?? ""
  }
  
  func displayIngredient6() -> String {
    return ingredient6 ?? ""
  }
  
  func displayIngredient7() -> String {
    return ingredient7 ?? ""
  }
  
  func displayIngredient8() -> String {
    return ingredient8 ?? ""
  }
  
  func displayIngredient9() -> String {
    return ingredient9 ?? ""
  }
  
  func displayIngredient10() -> String {
    return ingredient10 ?? ""
  }
  
  func displayIngredient11() -> String {
    return ingredient11 ?? ""
  }

  func displayIngredient12() -> String {
    return ingredient12 ?? ""
  }
  
  func displayIngredient13() -> String {
    return ingredient13 ?? ""
  }
  
  func displayIngredient14() -> String {
    return ingredient14 ?? ""
  }
  
  func displayIngredient15() -> String {
    return ingredient15 ?? ""
  }
  
  func displayIngredient16() -> String {
    return ingredient16 ?? ""
  }
  
  func displayIngredient17() -> String {
    return ingredient17 ?? ""
  }
  
  func displayIngredient18() -> String {
    return ingredient18 ?? ""
  }
  
  func displayIngredient19() -> String {
    return ingredient19 ?? ""
  }
  
  func displayIngredient20() -> String {
    return ingredient20 ?? ""
  }
  
  func displayMeasure1() -> String {
    return measure1 ?? ""
  }
  
  func displayMeasure2() -> String {
    return measure2 ?? ""
  }
  
  func displayMeasure3() -> String {
    return measure3 ?? ""
  }
  
  func displayMeasure4() -> String {
    return measure4 ?? ""
  }
  
  func displayMeasure5() -> String {
    return measure5 ?? ""
  }
  
  func displayMeasure6() -> String {
    return measure6 ?? ""
  }
  
  func displayMeasure7() -> String {
    return measure7 ?? ""
  }
  
  func displayMeasure8() -> String {
    return measure8 ?? ""
  }
  
  func displayMeasure9() -> String {
    return measure9 ?? ""
  }
  
  func displayMeasure10() -> String {
    return measure10 ?? ""
  }
  
  func displayMeasure11() -> String {
    return measure11 ?? ""
  }
  
  func displayMeasure12() -> String {
    return measure12 ?? ""
  }
  
  func displayMeasure13() -> String {
    return measure13 ?? ""
  }
  
  func displayMeasure14() -> String {
    return measure14 ?? ""
  }
  
  func displayMeasure15() -> String {
    return measure15 ?? ""
  }
  
  func displayMeasure16() -> String {
    return measure16 ?? ""
  }
  
  func displayMeasure17() -> String {
    return measure17 ?? ""
  }
  
  func displayMeasure18() -> String {
    return measure18 ?? ""
  }
  
  func displayMeasure19() -> String {
    return measure19 ?? ""
  }
  
  func displayMeasure20() -> String {
    return measure20 ?? ""
  }
 
    func displayMissingIng() -> String {
        if (missingIng == false) {
            return "false"
        }
        else {
            return "true"
        }
    }
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(id)
  }
  
  static func == (lhs: MealItem, rhs: MealItem) -> Bool {
    return (lhs.id == rhs.id)
  }
}
