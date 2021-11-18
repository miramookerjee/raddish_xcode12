//
//  WeekView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/16/21.
//

import SwiftUI

struct WeekView: View {
    var day: String
    @State var showingDetailSheet: Bool
    @ObservedObject var viewModel: ViewModel
  
    var body: some View {
      Section(header: Text(day)) {
          ScrollView(.horizontal) {
            LazyHStack(alignment: .center, spacing: 20) {
              EditButton()
                ForEach(viewModel.meals, id: \.self) { i in
                  if (i.day_of_week == day) {
                    RecipeInMealPlanView(i: i, showingDetailSheet: showingDetailSheet, viewModel: viewModel)
                  }
                }
            }
            .frame(minHeight: 185)
          }
      }
    }
}


