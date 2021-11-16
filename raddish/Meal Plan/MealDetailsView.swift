//
//  MealDetailsView.swift
//  raddish
//
//  Created by Esteban Vazquez Cardona on 11/15/21.
//

import SwiftUI

struct MealDetailsView: View {
  var recipe: Recipe
  @ObservedObject var viewModel = ViewModel()
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @Environment(\.managedObjectContext) private var viewContext
  

  var body: some View {
    NavigationView {
      VStack{
        AsyncImage(url: URL(string: recipe.strMealThumb)!,
                   placeholder: { Text("Loading...") })
          .frame(width: 107, height: 115)
          .cornerRadius(15)
            //TODO: shadow
            //.shadow(color: Color.black.opacity(0.3), radius: 20, x: -10, y: 10)
            
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
}

//struct MealDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailsView()
//    }
//}
