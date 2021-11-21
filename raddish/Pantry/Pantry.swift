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
}
