//
//  AccountViewModel.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 03/09/2023.
//

import SwiftUI

class AccountViewModel: ObservableObject {
  @Published var name: String = ""
  @Published var lastName: String = ""
  @Published var email: String = ""
  @Published var birthday: Date = Date()
  
  @Published var isExtraNapkinsToggled: Bool = false
  @Published var isFrequentRefillsToggled: Bool = false
  
}
