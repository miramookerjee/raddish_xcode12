//
//  DayOfWeekView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/9/21.
//

import SwiftUI

struct RecipeInMealPlanView: View {
  var i: MealItem
  @State var showingDetailSheet: Bool
  @ObservedObject var viewModel: ViewModel

  var body: some View {
    VStack {
      Button {
        showingDetailSheet.toggle()
      }
      label: {
        AsyncImage(url: URL(string: i.displayimageURL())!,
                   placeholder: { Text("Loading...") })
          .frame(width: 107, height: 114)
          .cornerRadius(15)
        }
      .sheet(isPresented: $showingDetailSheet) {
        RecipeDetailsView(
          recipe: Recipe(
            strMeal: i.displayName(), strInstructions: "", strMealThumb: i.displayimageURL(),
            ingredients: [], measures: [],
            strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "",
            strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "",
            strIngredient9: "", strIngredient10: "", strIngredient11: "",strIngredient12: "",
            strIngredient13: "",strIngredient14: "",strIngredient15: "", strIngredient16: "",
            strIngredient17: "", strIngredient18: "",strIngredient19: "", strIngredient20: "",
            strMeasure1: "", strMeasure2: "",strMeasure3: "", strMeasure4: "",
            strMeasure5: "", strMeasure6: "", strMeasure7: "",strMeasure8: "",
            strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "",
            strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "",
            strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: ""
  
            ) ,
          viewModel: viewModel
        )
    }
      Text(i.displayName())
        .frame(width: 120)
        .fixedSize(horizontal: false, vertical: true)
        .multilineTextAlignment(.center)
    }
    .overlay(DeleteButton(viewModel: viewModel, meal: i), alignment: .topTrailing)
  }
}

struct DeleteButton: View {
  
  @ObservedObject var viewModel: ViewModel
  @Environment(\.editMode) var editMode
  var meal: MealItem
  
  var body: some View {
    
    if self.editMode?.wrappedValue == .active {
      Button(action: { removeMeals(meal) }) {
        Image(systemName: "minus").font(Font.body.weight(.bold))
      }
      .frame(width: 25, height: 25)
      .background(Color.red)
      .foregroundColor(Color.white)
      .clipShape(Circle())
      .offset(x: 5, y: -10)
    }
  }
  
  private func removeMeals(_ meal: MealItem) {
    withAnimation {
      viewModel.deleteMealItem(mealItem: meal)
    }
  }
}
