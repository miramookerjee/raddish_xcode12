//
//  MealIngredientDetailView.swift
//  raddish
//
//  Created by Ankita Kundu on 11/19/21.
//

import SwiftUI

struct MealIngredientView: View {
    var mealIngredient: MealIngredient
    var body: some View {
        VStack(alignment: .leading) {
//            AsyncImage(url: URL(string: mealIngredient.strMealThumb),
//                       placeholder: { Text("Loading...") })
//                .frame(width: 107, height: 115)
//                .cornerRadius(15)
          Text(mealIngredient.strMeal)
        }
    }
}
