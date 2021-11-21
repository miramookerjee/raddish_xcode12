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
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()
    //@Binding var showAddView: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

  @State var name: String = ""
  @State var expiration: NSDate?
  @State private var date = Date()

  var body: some View {
    VStack {
      HStack {
        Text("Name:")
          .fontWeight(.bold)
          .padding(.leading)
        TextField("name", text: $name)
          .padding(.trailing)
    
        DatePicker(
            "Start Date",
            selection: $date,
            in: ...Date(),
            displayedComponents: .date
           )
      }
      //Spacer()
    }.padding()
    .navigationBarTitle("New Pantry Item")
    .navigationBarItems(trailing:
      Button(action: {
        self.viewModel.savePantryItem(name: self.name, expiration: NSDate(), date: date)
        self.mode.wrappedValue.dismiss()
      }) {
        Text("Done")
      }
  
    )
  }
}


