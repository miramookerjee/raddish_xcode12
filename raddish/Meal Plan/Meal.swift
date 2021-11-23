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
  var missing_ing:  Bool
  var id = UUID()


    init(day_of_week: String? = nil, name: String? = nil, imageURL: String? = nil, missing_ing: Bool) {
    self.day_of_week = day_of_week
    self.name = name
    self.imageURL = imageURL
    self.missing_ing = missing_ing
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
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(id)
  }
  
  static func == (lhs: MealItem, rhs: MealItem) -> Bool {
    return (lhs.id == rhs.id)
  }
}
