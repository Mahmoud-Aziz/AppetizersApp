//
//  ActivityIndicator.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
  @Binding var isAnimating: Bool
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView(style: style)
    view.color = .primaryColor
    return view
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
  }
}

struct LoadingView: View {
  @Binding var isAnimating: Bool
  
  var body: some View {
    ZStack {
      Color(.systemBackground)
        .edgesIgnoringSafeArea(.all)
      
      ActivityIndicator(isAnimating: $isAnimating, style: .large)
    }
  }
}
