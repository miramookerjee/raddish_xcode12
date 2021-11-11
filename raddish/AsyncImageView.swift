// source: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/
import SwiftUI
import Foundation

struct AsyncImage<Placeholder: View>: View {
  @StateObject private var loader: ImageLoader
      private let placeholder: Placeholder

      init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
          self.placeholder = placeholder()
          _loader = StateObject(wrappedValue: ImageLoader(url: url))
      }

      var body: some View {
          content
              .onAppear(perform: loader.load)
      }
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
