//
//  WeekView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/16/21.
//

import SwiftUI

struct WeekView: View {
    var day: String
    var delete: Optional<(IndexSet) -> Void>
    @State var showingSheet: Bool
    @State var showingDetailSheet: Bool
    @ObservedObject var viewModel: ViewModel
  
    var body: some View {
      Section(header: Text(day)) {
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
                  if (i.day_of_week == day) {
                    RecipeInMealPlanView(i: i, showingSheet: showingSheet, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                  }
                }
                .onDelete(perform: delete)
            }
          }
      }
    }
}


