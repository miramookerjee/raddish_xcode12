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
  @ObservedObject var viewModel: ViewModel
  let width = UIScreen.main.bounds.width * 0.75

  var body: some View {
    VStack {
        AsyncImage(url: URL(string: viewModel.ingredientImages(ingredient:pantryItem.displayName()))!,
                   placeholder: { Text("Loading...") })
            .frame(width: 107, height: 115)
            .cornerRadius(15)
      Text("Date added: " + pantryItem.displayDate())
      Text("Expiration date: " + pantryItem.displayExpDate())
      Text(pantryItem.displayName())
//        List {
//            ForEach(viewModel.$mealIngredients) {meal in
//              NavigationLink(destination: RecipeDetailsView(recipe: meal, viewModel: viewModel)) {
//                    MealIngredientDetailView(mealIngredient: meal)
//                }
//            }
//        }
      Spacer()
    }.navigationBarTitle(pantryItem.displayName())
  }
}
