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
      NavigationView {
          VStack{
              List {
                WeekView(day: "Monday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                
                WeekView(day: "Tuesday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                
                WeekView(day: "Wednesday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                
                WeekView(day: "Thursday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                
                WeekView(day: "Friday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                
                WeekView(day: "Saturday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                
                WeekView(day: "Sunday",  delete: delete, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                .listStyle(GroupedListStyle())
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

