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
      let ingredient = pantryItem.displayName()
      AsyncImage(url: URL(string: viewModel.ingredientImages(ingredient:pantryItem.displayName()))!,
                           placeholder: { Text("Loading...") })
                    .frame(width: 107, height: 115)
                    .cornerRadius(15)
      Text("Expires in __ days")
      Text(ingredient)
        .frame(width: width, height: width, alignment: .center)
        .padding()
       List {
        //prof h: this bug could also be here
        ForEach(viewModel.mealIngredients, id: \.self) { meal in
                        let _ = print(meal.strMeal)
                        Text(meal.strMeal)
        }
//        ForEach(viewModel.mealIngredients) {meal in
//            NavigationLink(meal.strMeal, destination: RecipeDetailsView(recipe: viewModel.createRecipe(recipe:meal.strMeal), viewModel: viewModel))
//            //{
//                    //MealIngredientView(mealIngredient: meal)
//                    //Label(meal.strMeal)
//            //}
//            }
        }
       .onAppear(perform: {
            self.viewModel.retrieveMealswithIng(ingredient: ingredient)
            //print(viewModel.retrieveMealswithIng(ingredient: ingredient))
       })
//        viewModel.retrieveMealswithIng(ingredient: ingredient)
//        ForEach(viewModel.mealIngredients, id: \.self) { meal in
//                Text("\(meal.strMeal)")
//            }
      Spacer()
    }.navigationBarTitle(pantryItem.displayName())
  }
}
