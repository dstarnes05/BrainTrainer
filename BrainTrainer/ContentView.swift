//
//  ContentView.swift
//  BrainTrainer
//
//  Created by Daniel Starnes on 1/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var playerScore = 0
    @State private var questionsAsked = 0
    @State private var winning = Bool.random()
    @State private var scoreTitle = ""
    
    @State private var showingScore = false
    @State private var gameComplete = false
    
    struct GameButton : View {
        var text: String
        var action: (String) -> ()
        
        var body: some View {
            Button(action: { action(text) }) {
                Text(text)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
            .bold(true)
        }
    }
    
    
    var body: some View {
        VStack() {
            Text("Brain Trainer")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            Spacer()
            
            Text("The app chooses \(moves[currentChoice]).")
            Text("You must \(winning ? "win" : "lose") this round.")
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
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: appChooses)
        } message: {
            Text("Your score is \(playerScore).")
        }
        
        .alert("Game is complete. Your total score is \(playerScore) out of 10.", isPresented: $gameComplete) {
            Button("Start Over", action: resetGame)
                .foregroundStyle(.red)
        }
    }
    
        func appChooses(){
            moves.shuffle()
            currentChoice = Int.random(in: 0...2)
            winning.toggle()
        }
    
        func resetGame(){
            gameComplete = false
            playerScore = 0
            questionsAsked = 0
        }
        
        func chooseMove(move: String) {
            if winning && moves[currentChoice] == "Rock" {
                if move == "Paper" {
                    playerScore += 1
                    scoreTitle = "Correct!"
                } else {
                    playerScore -= 1
                    scoreTitle = "Incorrect."
                }
            }
            if winning && moves[currentChoice] == "Paper" {
                if move == "Scissors" {
                    playerScore += 1
                    scoreTitle = "Correct!"
                } else {
                    playerScore -= 1
                    scoreTitle = "Incorrect."
                }
            }
            if winning && moves[currentChoice] == "Scissors" {
                if move == "Rock" {
                    playerScore += 1
                    scoreTitle = "Correct!"
                } else {
                    playerScore -= 1
                    scoreTitle = "Incorrect."
                }
            }
            if !winning && moves[currentChoice] == "Rock" {
                if move == "Scissors" {
                    playerScore += 1
                    scoreTitle = "Correct!"
                } else {
                    playerScore -= 1
                    scoreTitle = "Incorrect."
                }
            }
            if !winning && moves[currentChoice] == "Paper" {
                if move == "Rock" {
                    playerScore += 1
                    scoreTitle = "Correct!"
                } else {
                    playerScore -= 1
                    scoreTitle = "Incorrect."
                }
            }
            if !winning && moves[currentChoice] == "Scissors" {
                if move == "Paper" {
                    playerScore += 1
                    scoreTitle = "Correct!"
                } else {
                    playerScore -= 1
                    scoreTitle = "Incorrect."
                }
            }
            questionsAsked += 1
            
            if questionsAsked == 10 {
                gameComplete = true
            }
            
            showingScore = true
        }
    }

    

#Preview {
    ContentView()
}
