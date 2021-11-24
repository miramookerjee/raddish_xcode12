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
      if (measure != "" && ingredient != "") {
        HStack {
          Text(measure)
            .padding()
          Text(ingredient)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .border(Color.black)
        .cornerRadius(5)
        .padding(-1.0)
      }
    }
}



