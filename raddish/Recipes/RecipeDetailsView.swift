//
//  RecipesDetailsView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/2/21.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
  
    var body: some View {
      NavigationView {
        VStack{
            if #available(iOS 15.0, *) {
//              AsyncImage(url: URL(string: recipe.strMealThumb ))
//              { image in
//                  image.resizable()
//              } placeholder: {
//                  ProgressView()
//              }
//              .frame(width: 107, height: 115)
//              .cornerRadius(15)
              //TODO: shadow
              //.shadow(color: Color.black.opacity(0.3), radius: 20, x: -10, y: 10)
              Menu("Add to Meal Plan") {
                Button("Saturday", action: {addToMealPlan("Saturday")})
                Button("Friday", action: {addToMealPlan("Friday")})
                Button("Thursday", action: {addToMealPlan("Thursday")})
                Button("Wednesday", action: {addToMealPlan("Wednesday")})
                Button("Tuesday", action: {addToMealPlan("Tuesday")})
                Button("Monday", action: {addToMealPlan("Monday")})
                Button("Sunday", action: {addToMealPlan("Sunday")})
              }
              
          }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
              Button("Back") {
                  mode.wrappedValue.dismiss()
              }

            }
        }
      .navigationBarTitle(recipe.strMeal)
      }
      
    }
  
  private func addToMealPlan(_ dayOfWeek: String) {
    self.viewModel.saveMealItem(day_of_week: dayOfWeek, name: recipe.strMeal, imageURL: recipe.strMealThumb)
    self.mode.wrappedValue.dismiss()
    //UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    //RecipesView.mode.wrappedValue.dismiss()
  }
}

/*
struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      let recipeInstance = Recipe(strMeal: "Arrabiata", strInstructions: "No", strMealThumb: result.meals[0].strMealThumb);
      RecipeDetailsView(recipe: )
    }
}
*/
