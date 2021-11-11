////
////  URLImage.swift
////  LoadingImages
////
////  https://azamsharp.medium.com/asynchronously-loading-images-in-swiftui-3d0452230949
////  Created by Mohammad Azam on 6/20/19.
////  Copyright © 2019 Mohammad Azam. All rights reserved.
////
//import Foundation
//import SwiftUI
//
//struct URLImage: View {
//    
//  @ObservedObject private var imageLoader = ImageLoader(url: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")
//    
//    var placeholder: Image
//    
//    init(url: String, placeholder: Image = Image(systemName: "photo")) {
//        self.placeholder = placeholder
//        self.imageLoader.load(url: url)
//    }
//    
//    var body: some View {
//        if let uiImage = self.imageLoader.downloadedImage {
//            return Image(uiImage: uiImage)
//        } else {
//            return placeholder
//        }
//    }
//    
//}
