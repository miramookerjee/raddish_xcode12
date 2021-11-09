//
//  ContentView.swift
//  Test
//
//  Created by Mira Mookerjee on 10/27/21.
//

import SwiftUI
import CoreData



struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.expiration, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>


    var body: some View {
      TabView {
        MealPlanContentView(viewModel: viewModel)
            .tabItem {Label("Home", systemImage: "house.fill")}
        NavigationView {
          List {
            ForEach(viewModel.pantry) { pantryItem in
              NavigationLink(destination: PantryItemDetail(pantryItem: pantryItem)) {
                PantryItemRow(pantryItem: pantryItem)
              }
            }
            .onDelete(perform: delete)
          }
          .onAppear(perform: {
            self.viewModel.updatePantryItems()
          })
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
    
  //          }
  //        )
        }
        .tabItem {Label("Pantry", systemImage: "leaf.fill")}
        RecipesView(viewModel: viewModel)
        .tabItem {Label("Recipes", systemImage: "list.bullet.rectangle.portrait.fill")}
      }
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
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
