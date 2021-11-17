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
    //@Environment(\.managedObjectContext) private var viewContext
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.expiration, ascending: true)],
        animation: .default)
    var items: FetchedResults<Item>

    var body: some View {
      TabView {
        MealPlanContentView(viewModel: viewModel)
            .tabItem {Label("Home", systemImage: "house.fill")}
        PantryContentView(viewModel: viewModel, viewContext: _viewContext, items: items)
        .tabItem {Label("Pantry", systemImage: "leaf.fill")}
        RecipesView(viewModel: viewModel)
        .tabItem {Label("Recipes", systemImage: "list.bullet.rectangle.portrait.fill")}
      }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
