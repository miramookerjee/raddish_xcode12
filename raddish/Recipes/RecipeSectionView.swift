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
        
          if recipesList.count != 0 {
            ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
              ForEach(recipesList, id: \.self) { i in
                NavigationLink(destination: RecipeDetailsView(recipe: i, viewModel: viewModel)) {
                  VStack {
                    AsyncImage(url: URL(string: i.strMealThumb)!,
                               placeholder: { Text("Loading...") })
                      .scaledToFill()
                      .frame(height: 70)
                      .clipped()
                               
                    Text(i.strMeal)
                      .padding([.leading, .trailing, .bottom], 3)
                      .font(.system(size: 16))
                      .foregroundColor(.black)
                      .multilineTextAlignment(.center)
                      .lineLimit(2)
                      .frame(height: 45)
                  }
                }
                .background(Color.white)
                .frame(width: 130, height: 115)
                .cornerRadius(15)
                .shadow(radius: 3)
              }
            }
            .frame(minHeight: 140)
            }
          } else {
            Text("No ingredients in your pantry are expiring soon.")
              .foregroundColor(Color.gray)
//              .frame(width: 300)
              .padding()
          }
        
      }
    }
}

