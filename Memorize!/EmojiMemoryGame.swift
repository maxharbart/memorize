//
//  EmojiMemoryGame.swift
//  Memorize!
//
//  Created by Maxim Garbart on 16.12.2021.
//

import SwiftUI




class EmojiMemoryGame {
   static let animals = ["🐨", "🐵", "🐻", "🐷", "🐥", "🐴", "🦁", "🦉", "🐭", "🐶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in animals[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
