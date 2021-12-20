//
//  ContentView.swift
//  Memorize!
//
//  Created by Максим Гарбарт on 13.11.2021.
//

import SwiftUI
import GameplayKit


struct ContentView: View {
    
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView {
                
                //data from Model
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                
            }
        }
    }
}



struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                
                shape.fill()
                shape.accessibilityIdentifier(".")
                shape.strokeBorder(lineWidth: 3)
                shape.foregroundColor(.red)
                Text(card.content)
                    .font(.largeTitle)
        }
            
        else {
                shape.fill()
                shape.accessibilityIdentifier(".")
            }
            
        }
        
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
                .previewDevice("iPod touch (7th generation)")
                .preferredColorScheme(.light)
                .previewInterfaceOrientation(.portrait)
            
        }
    }
}

