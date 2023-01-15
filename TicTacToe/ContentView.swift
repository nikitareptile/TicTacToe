//
//  ContentView.swift
//  TicTacToe
//
//  Created by Никита Тихонюк on 11.01.2023.
//

import SwiftUI

enum Player {
    case human, computer
}

struct ContentView: View {
    
    let columnsGrid: [GridItem] = [GridItem(.flexible()),
                                   GridItem(.flexible()),
                                   GridItem(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isBoardDisabled = false
    
    var body: some View {
        VStack {
            Spacer()
            LazyVGrid(columns: columnsGrid) {
                ForEach(0..<9) { index in
                    ZStack {
                        Circle()
                            .foregroundColor(.orange)
                            .padding(.bottom, 6.6)
                        Image(systemName: moves[index]?.indicator ?? "")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding(.bottom, 6.6)
                    }
                    .onTapGesture {
                        if isCircleOccupied(in: moves, forIndex: index) { return }
                        moves[index] = Move(player: .human, boardIndex: index)
                        isBoardDisabled.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            let computerPosition = determineComputerMovePosition(in: moves)
                            moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                            isBoardDisabled.toggle()
                        }
                        
                    }
                }
            }
            Spacer()
        }
        .disabled(isBoardDisabled)
        .padding()
    }
    
    func isCircleOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        
        while isCircleOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
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
        ContentView()
    }
}
