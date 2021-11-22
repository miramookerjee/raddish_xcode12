//
//  AddPantryItem.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import SwiftUI

import SwiftUI
import UIKit

struct AddPantryItem: View {

  @ObservedObject var viewModel: ViewModel
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>

  @State var name: String = ""
  @State var expiration: Date?
  @State var date = Date()

  var body: some View {
    VStack {
      HStack {
        Text("name:")
          .fontWeight(.bold)
          .padding(.leading)
        TextField("name", text: $name)
          .padding(.trailing)
//        Text("date:")
//          .fontWeight(.bold)
//          .padding(.leading)
        DatePicker(
            "",
            selection: $date,
            in: ...Date(),
            displayedComponents: [.date]
           )
      }.padding()
      Spacer()
    }.padding()
    .navigationBarTitle("New Pantry Item")
    .navigationBarItems(trailing:
      Button(action: {
        self.viewModel.savePantryItem(name: self.name, expiration: self.viewModel.getIngExp(self.name, self.date), date: self.date)
      self.mode.wrappedValue.dismiss()
      }) {
        Text("Done")
      }
  
    )
  }
}
