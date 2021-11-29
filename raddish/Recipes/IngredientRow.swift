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
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        // https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-a-border-around-a-view
        .overlay(
                RoundedRectangle(cornerRadius: 20)
                  .stroke()
                  .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            )
        .cornerRadius(5)
        
      }
    }
}



