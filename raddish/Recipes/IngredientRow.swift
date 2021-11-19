//
//  IngredientRow.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/19/21.
//

import SwiftUI

struct IngredientRow: View {
    var ingredient : String
  var measure: String
    var body: some View {
      HStack {
        Text(ingredient)
          .padding()
        Text(measure)
          .padding()
      }
      .border(Color.black)
      .cornerRadius(15)
      .padding()
    }
}



