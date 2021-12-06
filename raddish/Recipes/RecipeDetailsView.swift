//
//  RecipesDetailsView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/2/21.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
  
    var body: some View {
      ScrollView {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: recipe.strMealThumb)!,
                     placeholder: { Text("Loading...") })
              .frame(width: 107, height: 115)
              .cornerRadius(15)
              .padding(.leading)
          ZStack(alignment: .center) {
              RoundedRectangle(cornerRadius: 5)
                .background(Color.green)
                .shadow(color: Color.gray, radius: 5)
                .frame(width: 150, height: 50)
                .padding(.leading)
              Menu("Add to Meal Plan") {
                  Button("Sunday", action: {addToMealPlan("Sunday")})
                  Button("Monday", action: {addToMealPlan("Monday")})
                  Button("Tuesday", action: {addToMealPlan("Tuesday")})
                  Button("Wednesday", action: {addToMealPlan("Wednesday")})
                  Button("Thursday", action: {addToMealPlan("Thursday")})
                  Button("Friday", action: {addToMealPlan("Friday")})
                  Button("Saturday", action: {addToMealPlan("Saturday")})
                }
              .foregroundColor(Color.white)
              .padding(.leading)
            }
          Text("Ingredients:")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
          Group {
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient1 ?? "", measure: recipe.strMeasure1 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient2 ?? "", measure: recipe.strMeasure2 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient3 ?? "", measure: recipe.strMeasure3 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient4 ?? "", measure: recipe.strMeasure4 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient5 ?? "", measure: recipe.strMeasure5 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient6 ?? "", measure: recipe.strMeasure6 ?? "")
          }
          Group {
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient7 ?? "", measure: recipe.strMeasure7 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient8 ?? "", measure: recipe.strMeasure8 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient9 ?? "", measure: recipe.strMeasure9 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient10 ?? "", measure: recipe.strMeasure10 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient11 ?? "", measure: recipe.strMeasure11 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient12 ?? "", measure: recipe.strMeasure12 ?? "")
          }
          Group {
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient13 ?? "", measure: recipe.strMeasure13 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient14 ?? "", measure: recipe.strMeasure14 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient15 ?? "", measure: recipe.strMeasure15 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient16 ?? "", measure: recipe.strMeasure16 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient17 ?? "", measure: recipe.strMeasure17 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient18 ?? "", measure: recipe.strMeasure18 ?? "")
          }
          Group {

            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient19 ?? "", measure: recipe.strMeasure19 ?? "")
            IngredientRow(viewModel: viewModel, ingredient: recipe.strIngredient20 ?? "", measure: recipe.strMeasure20 ?? "")
          }
          Text("Instructions:")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
          Text(recipe.strInstructions)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.leading)
            .padding(.trailing)
          }
      }
      .navigationBarTitle(recipe.strMeal)
    }
  
  private func addToMealPlan(_ dayOfWeek: String) {
    self.viewModel.saveMealItem(
      day_of_week: dayOfWeek, name: recipe.strMeal,
      imageURL: recipe.strMealThumb, instructions: recipe.strInstructions,
      ingredient1: recipe.strIngredient1, ingredient2: recipe.strIngredient2,
      ingredient3: recipe.strIngredient3, ingredient4: recipe.strIngredient4,
      ingredient5: recipe.strIngredient5, ingredient6: recipe.strIngredient6,
      ingredient7: recipe.strIngredient7, ingredient8: recipe.strIngredient8,
      ingredient9: recipe.strIngredient9, ingredient10: recipe.strIngredient10,
      ingredient11: recipe.strIngredient11, ingredient12: recipe.strIngredient12,
      ingredient13: recipe.strIngredient13, ingredient14: recipe.strIngredient14,
      ingredient15: recipe.strIngredient15, ingredient16: recipe.strIngredient16,
      ingredient17: recipe.strIngredient17, ingredient18: recipe.strIngredient18,
      ingredient19: recipe.strIngredient19, ingredient20: recipe.strIngredient20,
      measure1: recipe.strMeasure1, measure2: recipe.strMeasure2,
      measure3: recipe.strMeasure3, measure4: recipe.strMeasure4,
      measure5: recipe.strMeasure5, measure6: recipe.strMeasure6,
      measure7: recipe.strMeasure7, measure8: recipe.strMeasure8,
      measure9: recipe.strMeasure9, measure10: recipe.strMeasure10,
      measure11: recipe.strMeasure11, measure12: recipe.strMeasure12,
      measure13: recipe.strMeasure13, measure14: recipe.strMeasure14,
      measure15: recipe.strMeasure15, measure16: recipe.strMeasure16,
      measure17: recipe.strMeasure17, measure18: recipe.strMeasure18,
      measure19: recipe.strMeasure19, measure20: recipe.strMeasure20
    )
    self.viewModel.updateMealItems()
    self.viewModel.checkMealsMissingIng()
    self.mode.wrappedValue.dismiss()
    //UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
     //RecipesView.mode.wrappedValue.dismiss()
    //self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
  }
}

