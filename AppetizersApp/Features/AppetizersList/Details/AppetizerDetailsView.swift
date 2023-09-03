//
//  AppetizerDetailsView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 01/09/2023.
//

import SwiftUI

struct AppetizerDetailsView: View {
  
  let appetizer: Appetizer
  @Binding var isPresented: Bool
  
  var body: some View {
    
    ZStack {
      Color.black.opacity(0.1)
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
        
        OrderButtonView(title: "$\(appetizer.price, specifier: "%.2f") - Order Now")
        
        Spacer()
          .frame(height: 16)
      }
      .frame(width: 300, height: 525)
      .background(Color(.systemBackground))
      .cornerRadius(8)
      .shadow(radius: 40)
      .overlay(alignment: .topTrailing) {
        Button {
          isPresented = false
        } label: {
          Image(systemName: "x.circle")
            .foregroundColor(.red)
            .frame(width: 15, height: 15)
            .background(Color.white)
            .cornerRadius(15/2)
            .shadow(radius: 40)
            .padding(.trailing, 4)
            .padding(.top, 4)
        }
      }
    }
  }
}

struct AppetizeDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerDetailsView(appetizer: MockAppetizer.sampleData, isPresented: .constant(true))
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
        .multilineTextAlignment(.center)
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
  
  let title: LocalizedStringKey
  
  var body: some View {
    Button {
      print("tapped")
    } label: {
      Text(title)
        .foregroundColor(.white)
        .frame(width: 260, height: 50)
        .background(Color.primaryColor)
        .cornerRadius(8)
    }
  }
}
