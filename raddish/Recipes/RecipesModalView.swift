
//

import SwiftUI


struct RecipesModalView: View {
    
  @State private var showingSheet = false
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        
          NavigationView {
            VStack{
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
                                          Text("Hello")
//                                        if #available(iOS 15.0, *) {
//                                          AsyncImage(url: URL(string: i.strMealThumb ))
//                                          { image in
//                                              image.resizable()
//                                          } placeholder: {
//                                              ProgressView()
//                                          }
//                                          .frame(width: 107, height: 115)
//                                          .cornerRadius(15)
//                                          //TODO: shadow
//                                          //.shadow(color: Color.black.opacity(0.3), radius: 20, x: -10, y: 10)
//
//                                        } else {
//                                          fatalError("Oh no! Upgrade your phone")
//                                        }
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
              }
            .listStyle(GroupedListStyle())
          }
          .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    mode.wrappedValue.dismiss()
                }

              }
            }
          .navigationBarTitle("Recipes")
          .onAppear(perform: {
            self.viewModel.populateRecipes()
          })
        }
    }
}


