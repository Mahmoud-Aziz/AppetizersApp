//
//  NutrientsDataView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 02/09/2023.
//

import SwiftUI

struct NutrientsDataView: View {
  @State var nutrientsData: [NutrientsData] = []
  
  var body: some View {
    HStack {
      ForEach($nutrientsData, id: \.id) { nutrient in
        let wrappedNutrient = nutrient.wrappedValue
        HStack {
          VStack {
            Text(wrappedNutrient.title)
              .font(.headline)
              .fontWeight(.medium)
            
            Text(String(wrappedNutrient.value))
              .font(.subheadline)
              .fontWeight(.light)
              .fontDesign(.monospaced)
              .foregroundColor(.gray)
          }
          
          if !wrappedNutrient.isLast {
            Rectangle()
              .frame(width: 1, height: 25)
              .foregroundColor(.gray)
          }
        }
      }
      
    }
  }
}

struct NutrientsData: Hashable, Identifiable {
  var id = UUID()
  var title: String
  var value: Double
  var isLast: Bool = false
}
