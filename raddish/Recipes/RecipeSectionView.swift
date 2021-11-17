//
//  RecipeSectionView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/16/21.
//

import SwiftUI

struct RecipeSectionView: View {
    var sectionTitle: String
    @State var showingSheet = false
    @ObservedObject var viewModel: ViewModel
  
    var body: some View {
      Section(header: Text(sectionTitle)) {
          ScrollView(.horizontal) {
              HStack(alignment: .center, spacing: 20) {
                  
                ForEach(viewModel.recipes, id: \.self) { i in
                      VStack {
                        Button {
                          showingSheet.toggle()
                        }
                        label: {
                          AsyncImage(url: URL(string: i.strMealThumb)!,
                                     placeholder: { Text("Loading...") })
                            .frame(width: 107, height: 115)
                            .cornerRadius(15)
                        }
                        .sheet(isPresented: $showingSheet) {
                          // PROF H LOOK HERE
                          RecipeDetailsView(recipe: i, viewModel: viewModel)
                      }
                        Text(i.strMeal)
                      }
                  }
              }
            }
          }
    }
}

