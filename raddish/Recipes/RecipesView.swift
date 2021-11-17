
//

import SwiftUI


struct RecipesView: View {

    @State private var showingSheet = false
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  
    var body: some View {
        VStack{
            Text("Recipes")
                .font(.title)
            List {
              RecipeSectionView(sectionTitle: "Ingredients Expiring Soon", showingSheet: showingSheet, viewModel: viewModel)
              RecipeSectionView(sectionTitle: "Past Favorites", showingSheet: showingSheet, viewModel: viewModel)
              RecipeSectionView(sectionTitle: "Explore", showingSheet: showingSheet, viewModel: viewModel)
            }.listStyle(GroupedListStyle())
            .onAppear(perform: {
              self.viewModel.populateRecipes()
            })
        }
    }
}


