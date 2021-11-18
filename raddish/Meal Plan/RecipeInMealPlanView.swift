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
        RecipeDetailsView(recipe: Recipe(strMeal: i.displayName(), strInstructions: "", strMealThumb: i.displayimageURL()), viewModel: viewModel)
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
