//
//  OrderView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
      NavigationView {
        Text("Order View")
          .navigationTitle("Order")
      }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
