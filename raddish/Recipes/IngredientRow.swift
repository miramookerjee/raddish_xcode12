//
//  IngredientRow.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/19/21.
//

import SwiftUI

struct IngredientRow: View {
  @ObservedObject var viewModel: ViewModel
  var ingredient : String
  var measure: String
    var body: some View {
      if (measure != "" && ingredient != "") {
        HStack {
          AsyncImage(url: URL(string: viewModel.ingredientImages(ingredient:ingredient))!,
                     placeholder: { Text("Loading...") })
              .frame(width: 40, height: 40)
              .cornerRadius(15)
            .padding()
          Text(measure)
            .padding()
          

          Text(ingredient)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.green)


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



