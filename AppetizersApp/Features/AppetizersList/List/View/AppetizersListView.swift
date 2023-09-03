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
        List(viewModel.appetizers) { appetizer in
          AppetizerListItemView(name: appetizer.name, price: appetizer.price, imageURL: appetizer.appetizerImageURL)
            .onTapGesture {
              viewModel.selectedAppetizer = appetizer
              viewModel.isPresentDetails = true
            }
        }
        .navigationTitle("Appetizers")
        .onAppear {
          viewModel.getAppetizers()
        }
      }.disabled(viewModel.isPresentDetails)
      
      if viewModel.isPresentDetails {
        AppetizerDetailsView(appetizer: viewModel.selectedAppetizer!, isPresented: $viewModel.isPresentDetails)
      }
      
      if viewModel.isLoading {
        LoadingView(isAnimating: $viewModel.isLoading)
      }
    }.onTapGesture {
      if viewModel.isPresentDetails {
        viewModel.isPresentDetails = false 
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
