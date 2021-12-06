//
//  PantryItemView.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import SwiftUI
import Foundation

struct PantryItemRow: View {
  @ObservedObject var viewModel: ViewModel
  var pantryItem : PantryItem
  var body: some View {
    HStack {
      AsyncImage(url: URL(string: viewModel.ingredientImages(ingredient:pantryItem.displayName()))!,
                 placeholder: { Text("Loading...") })
        .frame(width: 40, height: 40)
        .cornerRadius(15)
      
      VStack(alignment: .leading) {
        Text(pantryItem.displayName())
        if viewModel.daysBetween(start: Date(), end: pantryItem.expiration!) <= 5 {
          Text(pantryItem.displayExpDays())
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(Color.red)
        } else {
          Text(pantryItem.displayExpDays())
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(Color.green)
        }
      }
    }
  }
}
