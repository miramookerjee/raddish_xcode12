//
//  ContentView.swift
//  raddish
//
//  Created by Ankita Kundu on 11/1/21.
//

import SwiftUI

struct MealPlanContentView: View {
    @State var showingSheet = false
    @State var showingDetailSheet = false
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

  func delete(at offsets: IndexSet) {
    viewModel.meals.remove(atOffsets: offsets)
    }

    var body: some View {
      VStack{
          List {
            WeekView(day: "Sunday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
            
            WeekView(day: "Monday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
            
            WeekView(day: "Tuesday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
            
            WeekView(day: "Wednesday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
            
            WeekView(day: "Thursday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
            
            WeekView(day: "Friday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
            
            WeekView(day: "Saturday", showingDetailSheet: showingDetailSheet, viewModel: viewModel)
      }
    }
    .onAppear(perform: {
      self.viewModel.updateMealItems()
    })
    .navigationBarTitle("Meal Plan")
    .navigationBarItems(trailing:
      NavigationLink(destination: RecipesView(viewModel: viewModel)) {
        Text("Add")
      }
    )
  }
}

