//
//  PantryItemView.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import SwiftUI

struct PantryItemRow: View {
  var pantryItem : PantryItem
  var body: some View {
    VStack(alignment: .leading) {
      Text(pantryItem.displayName())
    }
  }
}
