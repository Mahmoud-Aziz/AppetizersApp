//
//  AccountView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
      NavigationView {
        Text("Account View")
          .navigationTitle("Account")
      }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
