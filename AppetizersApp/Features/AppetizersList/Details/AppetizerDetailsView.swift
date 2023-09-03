//
//  AppetizerDetailsView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 01/09/2023.
//

import SwiftUI

struct AppetizerDetailsView: View {
  
  let appetizer: Appetizer
  
  var body: some View {
    
    ZStack {
      Color.black.opacity(0.3)
        .ignoresSafeArea(.all)
      VStack {
        ImageLoaderView(
          imageURL: appetizer.appetizerImageURL,
          imageHeight: 225,
          imageWidth: 300)
        
        Spacer()
          .frame(height: 8)
        
        AppetizerDescriptionView(appetizer: appetizer)
        
        Spacer()
        
        OrderButtonView()
        
        Spacer()
          .frame(height: 16)
      }
      .frame(width: 300, height: 525)
      .background(Color(.systemBackground))
      .cornerRadius(8)
      .shadow(radius: 40)
    }
  }
}

struct AppetizeDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerDetailsView(appetizer: MockAppetizer.sampleData)
  }
}

struct AppetizerDescriptionView: View {
  
  let appetizer: Appetizer
  
  var body: some View {
    VStack {
      Text(appetizer.name)
        .font(.title2)
        .fontWeight(.regular)
      
      Spacer()
        .frame(height: 8)
      
      Text(appetizer.description)
        .font(.body)
        .fontWeight(.ultraLight)
        .padding()
      
      
      Spacer()
        .frame(height: 8)
      
      NutrientsDataView(nutrientsData: [
        .init(title: "protein", value: Double(appetizer.protein)),
        .init(title: "carbs", value: Double(appetizer.carbs)),
        .init(title: "calories", value: Double(appetizer.calories), isLast: true)
      ])
    }
  }
}

struct OrderButtonView: View {
  var body: some View {
    Button {
      print("tapped")
    } label: {
      Text("Order")
        .foregroundColor(.white)
        .frame(width: 200, height: 50)
        .background(Color.red)
        .cornerRadius(8)
    }
  }
}
