//
//  AppetizersTabView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AppetizersTabView: View {
  var body: some View {
    TabView {
      AppetizersListView()
        .tabItem {
          Image(systemName: "house")
          Text("Appetizers")
        }
      
      OrderView()
        .tabItem {
          Image(systemName: "bag")
          Text("Order")
        }
      
      AccountView()
        .tabItem {
          Image(systemName: "person")
          Text("Account")
        }
    }.tint(.primaryColor)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizersTabView()
  }
}
