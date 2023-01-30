//
//  Alerts.swift
//  TicTacToe
//
//  Created by Никита Тихонюк on 30.01.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: String
    var message: String
    var buttonTitle: String
}

struct AlertContext {
    let humanWin    = AlertItem(title: "You win!", message: "Congratulations! You win your phone AI!", buttonTitle: "OK")
}
