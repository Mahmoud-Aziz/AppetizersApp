//
//  ImageLoaderView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 01/09/2023.
//

import SwiftUI

struct ImageLoaderView: View {
  
  let imageURL: URL?
  let imageHeight: CGFloat
  let imageWidth: CGFloat

  var body: some View {
    
    AsyncImage(url: imageURL) { phase in
      switch phase {
      case .empty:
        ProgressView()
          .frame(width: imageWidth, height: imageHeight)

      case .success(let image):
        image.resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: imageWidth, height: imageHeight)

      case .failure:
        Image("food-placeholder")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: imageWidth, height: imageHeight)
      @unknown default:
        EmptyView()
      }
    }
  }
}
