
//

import SwiftUI


struct RecipesView: View {
    
  @State private var showingSheet = false
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack{
            Text("Recipes")
                .font(.title)
            List {
                Section(header: Text("Ingredients Expiring Soon")) {
                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 20) {
                            
                          ForEach(viewModel.recipes, id: \.self) { i in
                            //NavigationLink(destination: RecipeDetailsView(recipe: i)) {
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
                                    RecipeDetailsView(recipe: i)
                                }
                                  Text(i.strMeal)
                                }
                              //}
                            }
                        }
                      }
                    }
                
                Section(header: Text("Past Favorites")) {
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .center, spacing: 20) {
                            ForEach(1...6, id: \.self) {
                                Text("Column \($0)")
                            }
                        }
                    }
                }
                
                Section(header: Text("Explore")) {
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .center, spacing: 20) {
                            ForEach(1...6, id: \.self) {
                                Text("Column \($0)")
                            }
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
            .onAppear(perform: {
              self.viewModel.populateRecipes()
            })
        }
    }
}


