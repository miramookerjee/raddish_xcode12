//
//  DayOfWeekView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/9/21.
//

import SwiftUI

struct DayOfWeekView: View {
    var i: MealItem
    @State var showingSheet: Bool
    @State var showingDetailSheet: Bool
    var viewModel: ViewModel
    //var image: Image
  
  // source: https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
  
//  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//  }
//
//  func downloadImage(from url: URL) {
//      print("Download Started")
//      getData(from: url) { data, response, error in
//          guard let data = data, error == nil else { return }
//          print(response?.suggestedFilename ?? url.lastPathComponent)
//          print("Download Finished")
//          // always update the UI from the main thread
//          DispatchQueue.main.async() { [self] in
//            self.image = UIImage(data: data)
//          }
//      }
//  }
  
    var body: some View {
      VStack {
        Button {
          showingDetailSheet.toggle()
        }
        label: {
          AsyncImage(url: URL(string: i.displayimageURL())!,
                     placeholder: { Text("Loading...") })
            .frame(width: 107, height: 115)
            .cornerRadius(15)
          }
        .sheet(isPresented: $showingDetailSheet) {
          RecipeDetailsView(recipe: Recipe(strMeal: i.displayName(), strInstructions: "", strMealThumb: i.displayimageURL()), viewModel: viewModel)
      }
        //Button(Text("Delete"), action: viewModel.deleteMealItem(i))
        Text(i.displayName())
      }
    }
}

//struct DayOfWeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayOfWeekView()
//    }
//}
