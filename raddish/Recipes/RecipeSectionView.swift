//
//  RecipeSectionView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/16/21.
//

import SwiftUI

struct RecipeSectionView: View {
    var sectionTitle: String
    var recipesList: [Recipe]
    @State var showingSheet = false
    @ObservedObject var viewModel: ViewModel
  
    var body: some View {
      Section(header: Text(sectionTitle)) {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 20) {
                
              ForEach(recipesList, id: \.self) { i in
                NavigationLink(destination: RecipeDetailsView(recipe: i, viewModel: viewModel)) {
                  VStack {
                    AsyncImage(url: URL(string: i.strMealThumb)!,
                               placeholder: { Text("Loading...") })
                        .frame(width: 107, height: 115)
                        .cornerRadius(15)
                               
                    Text(i.strMeal)
                  }
                }
              }
            }
          }
        }
    }
}

