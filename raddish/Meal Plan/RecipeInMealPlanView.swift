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
  @EnvironmentObject var viewModel: ViewModel

  var body: some View {
    VStack {
      
      NavigationLink(destination: RecipeDetailsView(
                        recipe: Recipe( id: i.id, 
                        strMeal: i.displayName(), strInstructions: i.displayInstructions(), strMealThumb: i.displayimageURL(),
                        strIngredient1: i.displayIngredient1(), strIngredient2: i.displayIngredient2(),
                        strIngredient3: i.displayIngredient3(), strIngredient4: i.displayIngredient4(),
                        strIngredient5: i.displayIngredient5(), strIngredient6: i.displayIngredient6(),
                        strIngredient7: i.displayIngredient7(), strIngredient8: i.displayIngredient8(),
                        strIngredient9: i.displayIngredient9(), strIngredient10: i.displayIngredient10(),
                        strIngredient11: i.displayIngredient11(), strIngredient12: i.displayIngredient12(),
                        strIngredient13: i.displayIngredient13(), strIngredient14: i.displayIngredient14(),
                        strIngredient15: i.displayIngredient15(), strIngredient16: i.displayIngredient16(),
                        strIngredient17: i.displayIngredient17(), strIngredient18: i.displayIngredient18(),
                        strIngredient19: i.displayIngredient19(), strIngredient20: i.displayIngredient20(),
                        strMeasure1: i.displayMeasure1(), strMeasure2: i.displayMeasure2(),
                        strMeasure3: i.displayMeasure3(), strMeasure4: i.displayMeasure4(),
                        strMeasure5: i.displayMeasure5(), strMeasure6: i.displayMeasure6(),
                        strMeasure7: i.displayMeasure7(), strMeasure8: i.displayMeasure8(),
                        strMeasure9: i.displayMeasure9(), strMeasure10: i.displayMeasure10(),
                        strMeasure11: i.displayMeasure11(), strMeasure12: i.displayMeasure12(),
                        strMeasure13: i.displayMeasure13(), strMeasure14: i.displayMeasure14(),
                        strMeasure15: i.displayMeasure15(), strMeasure16: i.displayMeasure16(),
                        strMeasure17: i.displayMeasure17(), strMeasure18: i.displayMeasure18(),
                        strMeasure19: i.displayMeasure19(), strMeasure20: i.displayMeasure20()
                        ) ,
                      viewModel: viewModel)
      ) {
        VStack {
          if i.missingIng == true {
            AsyncImage(url: URL(string: i.displayimageURL())!,
                       placeholder: { Text("Loading...") })
              .scaledToFill()
              .frame(height: 70)
              .clipped()
              .opacity(0.50)
              .brightness(-0.25)
          } else {
            AsyncImage(url: URL(string: i.displayimageURL())!,
                       placeholder: { Text("Loading...") })
              .scaledToFill()
              .frame(height: 70)
              .clipped()
          }
          
            Text(i.displayName())
              .padding(.bottom, 5)
              .font(.system(size: 16))
              .multilineTextAlignment(.center)
              .lineLimit(2)
              .frame(height: 45)
        }
      }
    }
    .background(Color.white)
    .frame(width: 130, height: 115)
    .cornerRadius(15)
    .shadow(radius: 3)
    .overlay(MissingIngButton(viewModel: viewModel, meal: i), alignment: .topTrailing)
    .overlay(DeleteButton(viewModel: viewModel, meal: i), alignment: .topTrailing)
  }
}

struct MissingIngButton: View {
  
  @State private var showingAlert = false
  @ObservedObject var viewModel: ViewModel
  var meal: MealItem
  
  var body: some View {
    
    if meal.missingIng == true {
      Button(action: { showingAlert = true }) {
        Image(systemName: "nosign").font(Font.body.weight(.bold))
      }
      .frame(width: 25, height: 25)
      .background(Color.gray)
      .foregroundColor(Color.white)
      .clipShape(Circle())
      .offset(x: 5, y: -10)
      .alert(isPresented: $showingAlert) {
        Alert(
                    title: Text("Just so you know..."),
                    message: Text("An ingredient in this recipe is not currently available in your pantry.")
                )
        
      }
    }
  }
  
  private func showMissingIng () {
    withAnimation {
      viewModel.deleteMealItem(mealItem: meal)
    }
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
