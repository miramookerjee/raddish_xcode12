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
              Text("Hello")
//              if #available(iOS 15.0, *) {
//                AsyncImage(url: URL(string: i.displayimageURL()))
//                { image in
//                    image.resizable()
//                } placeholder: {
//                    ProgressView()
//                }
//                .overlay(DeleteButton(mealItem: i, meals: viewModel.$meals, onDelete: delet) , alignment: .topTrailing)
//
//                .frame(width: 107, height: 115)
//                .cornerRadius(15)
//                //TODO: shadow
//                //.shadow(color: Color.black.opacity(0.3), radius: 20, x: -10, y: 10)
//
//              } else {
//                fatalError("Oh no! Upgrade your phone")
//                }
          viewModel.downloadImage(from: URL(string: i.displayimageURL()) ?? URL("https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"))
          }

        .sheet(isPresented: $showingDetailSheet) {
          RecipeDetailsView(recipe: Recipe(strMeal: i.displayName(), strInstructions: "", strMealThumb: i.displayimageURL()), viewModel: viewModel)
      }
        //Button(Text("Delete"), action: viewModel.deleteMealItem(i))
        Text(i.displayName())
      }
    }
}

//struct DayOfWeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayOfWeekView()
//    }
//}
