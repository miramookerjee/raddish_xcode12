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
  @Environment(\.editMode) var editMode
  
    var body: some View {
      Section(header: Text(day)) {
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: 20) {
              EditButton()
                .foregroundColor(Color.green)
              HStack {
                Divider()
                  .background(Color.green)
              }
              .frame(height: 120)
              
                ForEach(viewModel.meals, id: \.self) { i in
                  if (i.day_of_week == day) {
                    RecipeInMealPlanView(i: i, showingDetailSheet: showingDetailSheet)
                  }
                }
            }
            .frame(minHeight: 140)
          }
      }
      .foregroundColor(Color.black)
    }
}
