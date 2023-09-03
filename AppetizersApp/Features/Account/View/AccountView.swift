//
//  AccountView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AccountView: View {
  
@StateObject var viewModel: AccountViewModel = AccountViewModel()
  
  var body: some View {
      NavigationView {
        Form {
          PersonalInfoSectionView(
            name: $viewModel.name,
            lastName: $viewModel.lastName,
            email: $viewModel.email,
            birthday: $viewModel.birthday)
          
          RequestsSectionView(
            isExtraNapkinsToggled: $viewModel.isExtraNapkinsToggled,
            isFrequentRefillsToggled: $viewModel.isFrequentRefillsToggled)
        }.navigationTitle("Account")
      }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}

struct PersonalInfoSectionView: View {
  @Binding var name: String
  @Binding var lastName: String
  @Binding var email: String
  @Binding var birthday: Date
  
  var body: some View {
    Section(header: Text("Personal Info")) {
      TextField("Name", text: $name)
      TextField("Last Name", text: $lastName)
      TextField("Email", text: $email)
        .keyboardType(.emailAddress)
      DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
      
      ZStack {
        Color.primaryColor
          .opacity(0.2)
          .cornerRadius(8)
        
        Button {
          
        } label: {
          Text("Save Changes")
            .foregroundColor(.primaryColor)
        }
      }
    }
  }
}

struct RequestsSectionView: View {
  @Binding var isExtraNapkinsToggled: Bool
  @Binding var isFrequentRefillsToggled: Bool
  
  var body: some View {
    Section(header: Text("Requests")) {
      Toggle("Extra Napkins", isOn: $isExtraNapkinsToggled)
        .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
      
      Toggle("Frequent Refills", isOn: $isFrequentRefillsToggled)
        .toggleStyle(SwitchToggleStyle(tint: .primaryColor))

    }
  }
}
