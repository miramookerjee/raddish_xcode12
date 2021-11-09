//
//  PantryItemDetail.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import Foundation
import SwiftUI

struct PantryItemDetail: View {

  var pantryItem: PantryItem
  let width = UIScreen.main.bounds.width * 0.75

  var body: some View {
    VStack {
      Text(pantryItem.displayName()
      )
        .frame(width: width, height: width, alignment: .center)
        .padding()
      Spacer()
    }.navigationBarTitle(pantryItem.displayName())
  }
}
