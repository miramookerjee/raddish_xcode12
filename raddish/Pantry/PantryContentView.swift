//
//  PantryContentView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/16/21.
//

import SwiftUI


struct PantryContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var viewContext
    var items: FetchedResults<Item>
    @State private var showAddView = false
  
    var body: some View {
      List {
        Section(header: Text("Expiring Soon")) {
          ForEach(viewModel.fetchItemsExpiringSoon()) { pantryItem in
            NavigationLink(destination: PantryItemDetail(pantryItem: pantryItem)) {
              PantryItemRow(viewModel: viewModel, pantryItem: pantryItem)
            }
          }
          .onDelete(perform: delete)
        }
        
        Section(header: Text("All")) {
          ForEach(viewModel.pantry.sorted(by: { $0.expiration! < $1.expiration! })) { pantryItem in
            NavigationLink(destination: PantryItemDetail(pantryItem: pantryItem)) {
              PantryItemRow(viewModel: viewModel, pantryItem: pantryItem)
            }
          }
          .onDelete(perform: delete)
        }
      }
      .listStyle(GroupedListStyle())
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              EditButton()
          }
          ToolbarItem {
            NavigationLink(destination: AddPantryItem(viewModel: viewModel)) {
                              Label("Add Item", systemImage: "plus")
                          }
          }
      }
      .navigationBarTitle("Pantry")
    }
    
  private func addItem() {
    withAnimation {
        let newItem = Item(context: viewContext)
        newItem.expiration = Date()

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
        offsets.map { items[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
  }

  func delete(at offsets: IndexSet) {
    viewModel.deletePantryItem(atOffsets: offsets)
  }
  
  private let itemFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      formatter.timeStyle = .medium
      return formatter
  }()
}
