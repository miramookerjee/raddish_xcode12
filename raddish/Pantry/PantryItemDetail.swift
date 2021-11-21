//
//  PantryItemDetail.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import Foundation
import SwiftUI

struct PantryItemDetail: View {

  var pantryItem: PantryItem
  let width = UIScreen.main.bounds.width * 0.75

  var body: some View {
    VStack {
      Text("Date added: " + pantryItem.displayDate())
      Text("Expiration date: " + pantryItem.displayExpDate())
    }.navigationBarTitle(pantryItem.displayName())
  }
}
