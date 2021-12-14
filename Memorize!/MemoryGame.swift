//
//  MemoryGame.swift
//  Memorize!
//
//  Created by Maxim Garbart on 14.12.2021.
//

import Foundation

struct MemoryGame {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
        //some comment
    }
}
