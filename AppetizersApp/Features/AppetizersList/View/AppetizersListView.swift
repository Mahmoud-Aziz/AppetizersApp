//
//  AppetizersListView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AppetizersListView: View {
 @StateObject private var viewModel: AppetizersListViewModel = AppetizersListViewModel()

  var body: some View {
    ZStack {
      NavigationView {
        List {
          ForEach(viewModel.appetizers, id: \.id) { appetizer in
            AppetizerListItemView(name: appetizer.name, price: appetizer.price, imageURL: appetizer.appetizerImageURL)
          }
        }
        .navigationTitle("Appetizers")
        .onAppear {
          viewModel.getAppetizers()
        }
      }
      if viewModel.isLoading {
        LoadingView(isAnimating: $viewModel.isLoading)
      }
    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(title: alertItem.title,
            message: alertItem.message,
            dismissButton: alertItem.dismissButton)
    }
  }
}

struct AppetizersListView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizersListView()
  }
}

enum AppError: LocalizedError {
  case requestFailed
}
