//
//  AppetizersListViewModel.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

class AppetizersListViewModel: ObservableObject {
  private let apiService: APIServiceProtocol
  @Published var appetizers: [Appetizer] = []
  @Published var appetizersImages: [Data] = []
  @Published var isLoading: Bool = false
  @Published var alertItem: AlertItem?
  @Published var isPresentDetails: Bool = false

  var selectedAppetizer: Appetizer? {
    didSet {
      isPresentDetails.toggle()
    }
  }
  
  init(apiService: APIServiceProtocol = APIService()) {
    self.apiService = apiService
  }
  
  func getAppetizers() {
    let request = APIBuilder()
      .setHost(.baseURL)
      .setPath(.appetizers)
      .build()
    isLoading = true
    apiService.sendRequest(decodable: Appetizers.self, request: request) { [weak self] result in
      self?.isLoading = false
      switch result {
      case .success(let response):
        self?.appetizers = response.appetizers
      case .failure:
        self?.alertItem = AlertContext.errorGettingData
      }
    }
  }
  
  func downloadImage() {
    for appetizer in appetizers {
      guard let url = URL(string: appetizer.imageURL) else { return }
      apiService.downloadImage(from: url) { [weak self] result in
        switch result {
        case .success(let response):
          self?.appetizersImages.append(response)
        case .failure:
          self?.alertItem = AlertContext.errorGettingData
        }
      }
    }
  }
}
