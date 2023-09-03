//
//  AccountView.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AccountView: View {
  var body: some View {
    @State var name: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var birthday: Date = Date()
    
    @State var isExtraNapkinsToggled: Bool = false
    @State var isFrequentRefillsToggled: Bool = false
    
    NavigationView {
      Form {
        PersonalInfoSectionView(
          name: $name,
          lastName: $lastName,
          email: $email,
          birthday: $birthday)
        
        RequestsSectionView(
          isExtraNapkinsToggled: $isExtraNapkinsToggled,
          isFrequentRefillsToggled: $isFrequentRefillsToggled)
      }
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
      Toggle("Frequent Refills", isOn: $isFrequentRefillsToggled)
    }
  }
}
