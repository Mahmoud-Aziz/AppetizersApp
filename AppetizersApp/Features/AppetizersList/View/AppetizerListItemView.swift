//
//  AppetizerListItemView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AppetizerListItemView: View {
  let name: String
  let price: Double
  let imageURL: URL?
  
  var body: some View {
    HStack {
      AsyncImage(url: imageURL) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: 120, height: 90)
        case .success(let image):
          image.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
        case .failure:
          Image("food-placeholder")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
        @unknown default:
          EmptyView()
        }
      }
      .cornerRadius(8)
      
      VStack(alignment: .leading) {
        Text(name)
          .font(.title2)
          .fontWeight(.medium)
        
        Spacer()
          .frame(height: 8)
        
        Text("$\(price, specifier: "%.2f")")
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
      }      .padding(.leading)
    }
  }
}
