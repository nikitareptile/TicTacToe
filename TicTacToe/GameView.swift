//
//  GameView.swift
//  TicTacToe
//
//  Created by Никита Тихонюк on 11.01.2023.
//

import SwiftUI

enum Player {
    case human, computer
}

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("TicTacToe")
                .font(.title)
                .fontWeight(.medium)
            Text("Base game")
            Spacer()
            LazyVGrid(columns: viewModel.columnsGrid) {
                ForEach(0..<9) { index in
                    ZStack {
                        GameCircleView()
                        PlayerIndicator(systemImageName: viewModel.moves[index]?.indicator ?? "")
                    }
                    .onTapGesture {
                        viewModel.processPlayerMove(for: index)
                    }
                }
            }
            Spacer()
            Text("Your score is: ")
            Text("Your highscore is: ")
        }
        .disabled(viewModel.isBoardDisabled)
        .padding()
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
        })
    }
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameCircleView: View {
    var body: some View {
        Circle()
            .foregroundColor(.orange)
            .padding(.bottom, 6.6)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
            .padding(.bottom, 6.6)
    }
}
