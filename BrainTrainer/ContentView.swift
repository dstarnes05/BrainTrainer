//
//  ContentView.swift
//  BrainTrainer
//
//  Created by Daniel Starnes on 1/12/26.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var playerScore = 0
    @State private var questionsAsked = 0
    @State private var winning = Bool.random()
    
    struct GameButton : View {
        var text: String
        var action: (String) -> ()
        
        var body: some View {
            Button(action: { action(text) }) {
                Text(text)
            }
        }
    }
    
    
    var body: some View {
        VStack() {
            Text("Brain Trainer")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            Spacer()
            
            Text("The app chooses \(moves[currentChoice]). You must \(winning ? "win" : "lose") this round.")
                .foregroundStyle(winning ? .green : .red)
            
            Spacer()
            
            VStack {
                GameButton(text: "Rock", action: chooseMove)
                GameButton(text: "Paper", action: chooseMove)
                GameButton(text: "Scissors", action: chooseMove)
            }
            
            Spacer()
            
            Text("Current Score: \(playerScore)")
            
            
            
        }
    }
        
        func chooseMove(move: String) {
            if winning && moves[currentChoice] == "Rock" {
                if move == "Paper" {
                    playerScore += 1
                } else {
                    playerScore -= 1
                }
            }
            if winning && moves[currentChoice] == "Paper" {
                if move == "Scissors" {
                    playerScore += 1
                } else {
                    playerScore -= 1
                }
            }
            if winning && moves[currentChoice] == "Scissors" {
                if move == "Rock" {
                    playerScore += 1
                } else {
                    playerScore -= 1
                }
            }
            if !winning && moves[currentChoice] == "Rock" {
                if move == "Scissors" {
                    playerScore += 1
                } else {
                    playerScore -= 1
                }
            }
            if !winning && moves[currentChoice] == "Paper" {
                if move == "Scissors" {
                    playerScore += 1
                } else {
                    playerScore -= 1
                }
            }
            if !winning && moves[currentChoice] == "Scissors" {
                if move == "Rock" {
                    playerScore += 1
                } else {
                    playerScore -= 1
                }
            }
        }
    }

    

#Preview {
    ContentView()
}
