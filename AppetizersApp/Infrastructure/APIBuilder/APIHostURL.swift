//
//  APIHostURL.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import Foundation

enum APIHostURL {
  case baseURL
  
  var url: URL? {
    let url: String
    switch self {
    case .baseURL:
      url = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
      return URL(string: url)
    }
  }
}
