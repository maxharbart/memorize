//
//  Memorize_App.swift
//  Memorize!
//
//  Created by Максим Гарбарт on 13.11.2021.
//

import SwiftUI

@main
struct Memorize_App: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
