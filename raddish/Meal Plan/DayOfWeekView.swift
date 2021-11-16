//
//  DayOfWeekView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/9/21.
//

import SwiftUI

struct DayOfWeekView: View {
    var i: MealItem
    @State var showingSheet: Bool
    @State var showingDetailSheet: Bool
  var viewModel: ViewModel
  
    var body: some View {
      VStack {
        Button {
          showingDetailSheet.toggle()
        }
        label: {
          AsyncImage(url: URL(string: i.displayimageURL())!,
                     placeholder: { Text("Loading...") })
            .frame(width: 107, height: 115)
            .cornerRadius(15)
        }
        .sheet(isPresented: $showingDetailSheet) {
          MealDetailsView(recipe: Recipe(strMeal: i.displayName(), strInstructions: "", strMealThumb: i.displayimageURL()), viewModel: viewModel)
        }
        //Button(Text("Delete"), action: viewModel.deleteMealItem(i))
        Text(i.displayName())
        Button("Delete", action: deleteMeal(meal: i))
      }
    }
  
  private func deleteMeal(meal: MealItem) {
    viewModel.deleteMealItem(mealItem: meal)
  }
}

//struct DayOfWeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayOfWeekView()
//    }
//}
