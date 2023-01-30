//
//  Alerts.swift
//  TicTacToe
//
//  Created by Никита Тихонюк on 30.01.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin    = AlertItem(title: Text("You win!"),
                                       message: Text("Congratulations! You win your phone AI!"),
                                       buttonTitle: Text("OK"))
    
    static let computerWin = AlertItem(title: Text("You Lose!"),
                                       message: Text("Don't be sad. Take your time and breathe."),
                                       buttonTitle: Text("Rematch"))
    
    static let draw        = AlertItem(title: Text("It's a draw!"),
                                       message: Text("Are you computer?"),
                                       buttonTitle: Text("YES"))
}
