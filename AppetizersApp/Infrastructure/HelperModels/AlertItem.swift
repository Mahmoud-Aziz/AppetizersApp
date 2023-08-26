//
//  AlertItem.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    static let errorGettingData = AlertItem(title: Text("Something wrong happened"),
                                              message: Text("Something is wrong, Please try again."),
                                              dismissButton: .default(Text("OK")))
}
