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
      VStack{
            AsyncImage(url: URL(string: recipe.strMealThumb)!,
                     placeholder: { Text("Loading...") })
            .frame(width: 107, height: 115)
            .cornerRadius(15)
              Menu("Add to Meal Plan") {
                Button("Sunday", action: {addToMealPlan("Sunday")})
                Button("Monday", action: {addToMealPlan("Monday")})
                Button("Tuesday", action: {addToMealPlan("Tuesday")})
                Button("Wednesday", action: {addToMealPlan("Wednesday")})
                Button("Thursday", action: {addToMealPlan("Thursday")})
                Button("Friday", action: {addToMealPlan("Friday")})
                Button("Saturday", action: {addToMealPlan("Saturday")})
              }
          Text("Ingredients:")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
          Text("Instructions:")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
          Text(recipe.strInstructions)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.leading)
            .padding(.trailing)
          }
      }
      .navigationBarTitle(recipe.strMeal)
    }
  
  private func addToMealPlan(_ dayOfWeek: String) {
    self.viewModel.saveMealItem(day_of_week: dayOfWeek, name: recipe.strMeal, imageURL: recipe.strMealThumb)
    self.mode.wrappedValue.dismiss()
    //UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    //RecipesView.mode.wrappedValue.dismiss()
  }
}

