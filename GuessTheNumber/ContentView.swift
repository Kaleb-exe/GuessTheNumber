//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by 64001050 on 2/21/24.
//

// test comment to test github

import SwiftUI

struct ContentView: View {
    @State var guess = ""
    @State var feedback = ""
    let targetNumber = Int.random(in: 1...100)
    @State var gameEnded = false

    // Hello there :)
    var body: some View {
        VStack {
            Text("Welcome to Guess the Number!")
            Text("I've selected a number between 1 and 100. Can you guess what it is?")
            TextField("Enter your guess", text: $guess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            Button("Submit Guess") {
                guard let guessInt = Int(guess) else {
                    feedback = "Invalid input. Please enter a valid number."
                    return
                }

                if guessInt == targetNumber {
                    gameEnded = true
                } else {
                    feedback = "Sorry, that's not the correct number. Try again!"
                }
            }
            .padding()
            Text(feedback)
        }
        .padding()
        .alert(isPresented: $gameEnded) {
            Alert(title: Text("Congratulations!"),
                  message: Text("You guessed the correct number!"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
