//
//  ContentView.swift
//  raddish
//
//  Created by Ankita Kundu on 11/1/21.
//

import SwiftUI

// source: https://stackoverflow.com/questions/57130866/how-to-show-navigationlink-as-a-button-in-swiftui
//struct ButtonView: View {
//  var body: some View {
//      .frame(width: 200, height: 100, alignment: .center)
//      .background(Color(red: 76.9 / 255, green: 76.9 / 255, blue: 76.9 / 255))
//      .foregroundColor(Color.red)
//  }
//}v

// TODO: cite stackoverflow
struct DeleteButton: View {
    @Environment(\.editMode) var editMode

    let mealItem: MealItem
    @Binding var meals: [MealItem]
    let onDelete: (IndexSet) -> ()

    var body: some View {
        VStack {
            if self.editMode?.wrappedValue == .active {
                Button(action: {
                    if let index = meals.firstIndex(of: mealItem) {
                        self.onDelete(IndexSet(integer: index))
                    }
                }) {
                    Image(systemName: "minus.circle")
                }
                .offset(x: 10, y: -10)
            }
        }
    }
  
}

struct MealPlanContentView: View {
    @State var showingSheet = false
    @State var showingDetailSheet = false
    var viewModel: ViewModel
    //var indexSet = IndexSet(viewModel.recipes)
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//
//
  func delet(at offsets: IndexSet) {
    viewModel.meals.remove(atOffsets: offsets)
    }


    var body: some View {
      NavigationView {
          VStack{
  //            Text("Meal Plan")
  //                .font(.title)
              
              List {
                  Section(header: Text("Monday")) {
                      ScrollView(.horizontal) {
                        LazyHStack(alignment: .center, spacing: 20) {
                          Button("Add") {
                                      showingSheet.toggle()
                                      
                                  }
                                  .frame(minHeight: 150)
                                  .sheet(isPresented: $showingSheet) {
                                      RecipesModalView(viewModel: viewModel)
                                  }
                            ForEach(viewModel.meals, id: \.self) { i in
                              if (i.day_of_week == "Monday") {
                                Text("Hello")
                                DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                              }
                            }
                            //.onDelete(perform: delet)
                        }
                      }
                  }

                Section(header: Text("Tuesday")) {
                    ScrollView(.horizontal) {
                      LazyHStack(alignment: .center, spacing: 20) {
                        Button("Add") {
                                    showingSheet.toggle()
                                    
                                }
                                .frame(minHeight: 150)
                                .sheet(isPresented: $showingSheet) {
                                    RecipesModalView(viewModel: viewModel)
                                }
                        ForEach(viewModel.meals, id: \.self) { i in
                          if (i.day_of_week == "Tuesday") {
                            DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                          }
                        }
                      }
                    }
                }
                  
                Section(header: Text("Wednesday")) {
                    ScrollView(.horizontal) {
                      LazyHStack(alignment: .center, spacing: 20) {
                        Button("Add") {
                                    showingSheet.toggle()
                                    
                                }
                                .frame(minHeight: 150)
                                .sheet(isPresented: $showingSheet) {
                                    RecipesModalView(viewModel: viewModel)
                                }
                        ForEach(viewModel.meals, id: \.self) { i in
                          if (i.day_of_week == "Wednesday") {
                            DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                          }
                        }
                      }
                    }
                }
                  
                Section(header: Text("Thursday")) {
                    ScrollView(.horizontal) {
                      LazyHStack(alignment: .center, spacing: 20) {
                        Button("Add") {
                                    showingSheet.toggle()
                                    
                                }
                                .frame(minHeight: 150)
                                .sheet(isPresented: $showingSheet) {
                                    RecipesModalView(viewModel: viewModel)
                                }
                        ForEach(viewModel.meals, id: \.self) { i in
                          if (i.day_of_week == "Thursday") {
                            DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                          }
                        }
                      }
                    }
                }
                  
                Section(header: Text("Friday")) {
                    ScrollView(.horizontal) {
                      LazyHStack(alignment: .center, spacing: 20) {
                        Button("Add") {
                                    showingSheet.toggle()
                                    
                                }
                                .frame(minHeight: 150)
                                .sheet(isPresented: $showingSheet) {
                                    RecipesModalView(viewModel: viewModel)
                                }
                        ForEach(viewModel.meals, id: \.self) { i in
                          if (i.day_of_week == "Friday") {
                            DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                          }
                        }
                      }
                    }
                }
                  
                Section(header: Text("Saturday")) {
                    ScrollView(.horizontal) {
                      LazyHStack(alignment: .center, spacing: 20) {
                        Button("Add") {
                                    showingSheet.toggle()
                                    
                                }
                                .frame(minHeight: 150)
                                .sheet(isPresented: $showingSheet) {
                                    RecipesView(viewModel: viewModel)
                                }
                        ForEach(viewModel.meals, id: \.self) { i in
                          if (i.day_of_week == "Saturday") {
                            DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                          }
                        }
                      }
                    }
                }
                  
                Section(header: Text("Sunday")) {
                    ScrollView(.horizontal) {
                      LazyHStack(alignment: .center, spacing: 20) {
                        Button("Add") {
                                    showingSheet.toggle()
                                    
                                }
                                .frame(minHeight: 150)
                                .sheet(isPresented: $showingSheet) {
                                    RecipesView(viewModel: viewModel)
                                }
                        ForEach(viewModel.meals, id: \.self) { i in
                          if (i.day_of_week == "Sunday") {
                            DayOfWeekView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                          }
                        }
                      }
                    }
                }.listStyle(GroupedListStyle())
          }
          .onAppear(perform: {
            self.viewModel.updateMealItems()
          })
          .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                  EditButton()
              }
          }
          .navigationBarTitle("Meal Plan")
      }
    }
  }
}

