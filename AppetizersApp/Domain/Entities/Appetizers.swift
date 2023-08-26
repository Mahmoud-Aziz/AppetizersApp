//
//  Appetizers.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import Foundation

struct Appetizers: Decodable {
    let appetizers: [Appetizer]
  
  enum CodingKeys: String, CodingKey {
    case appetizers = "request"
  }
}

struct Appetizer: Decodable, Identifiable {
  let id: Int
  let name: String
  let description: String
  let price: Double
  let imageURL: String
  let calories, carbs, protein: Int
}

extension Appetizer {
  var appetizerImageURL: URL? {
    guard let url = URL(string: imageURL) else { return nil }
    return url
  }
}


struct MockAppetizer {
  static let sampleData = Appetizer(id: 0011,
                                    name: "Test Appetizer",
                                    description: "This is the description for my appetizer",
                                    price: 99.0,
                                    imageURL: "",
                                    calories: 50,
                                    carbs: 12,
                                    protein: 66)
  
  static let appetizers = [
    sampleData,
    sampleData,
    sampleData,
    sampleData
  ]
}
