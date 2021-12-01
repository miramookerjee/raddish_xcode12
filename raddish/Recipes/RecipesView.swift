
//

import SwiftUI


struct RecipesView: View {

    @State private var showingSheet = false
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  
    var body: some View {
      VStack{
        List {
          RecipeSectionView(sectionTitle: "Ingredients Expiring Soon", recipesList: viewModel.recipesIngExpSoon, showingSheet: showingSheet, viewModel: viewModel)
          RecipeSectionView(sectionTitle: "Past Favorites", recipesList: viewModel.recipes, showingSheet: showingSheet, viewModel: viewModel)
          RecipeSectionView(sectionTitle: "Explore", recipesList: viewModel.recipes, showingSheet: showingSheet, viewModel: viewModel)
        }
        .listStyle(GroupedListStyle())
        .onAppear(perform: {
          self.viewModel.fetchRecipesIngExpSoon()
          self.viewModel.populateRecipes()
        })
      }
      .navigationBarTitle("Recipes")
    }
}


