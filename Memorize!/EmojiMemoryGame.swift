//
//  EmojiMemoryGame.swift
//  Memorize!
//
//  Created by Maxim Garbart on 16.12.2021.
//

import SwiftUI




class EmojiMemoryGame: ObservableObject {
   static let animals = ["🐨", "🐵", "🐻", "🐷", "🐥", "🐴", "🦁", "🦉", "🐭", "🐶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in animals[pairIndex]
        }
    }
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: Intent
    
    func choose (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
