//
//  ContentView.swift
//  Memorize!
//
//  Created by Максим Гарбарт on 13.11.2021.
//

import SwiftUI
import GameplayKit


struct ContentView: View {
    
    @State var animals: [String] = ["🐨", "🐵", "🐻", "🐷", "🐥", "🐴", "🦁", "🦉", "🐭", "🐶",]
    @State var flags: [String] = ["🇫🇮", "🇯🇵", "🇲🇽", "🇷🇺", "🇹🇼", "🇺🇦", "🇿🇦", "🇹🇭", "🇬🇧", "🇱🇹" ]
    @State var food: [String] = ["🥐", "🍜", "🍰", "🍗", "🍦", "🌮", "🫔", "🍝", "🥔", "🍞"]
    @State var emojiCount = 9
    @State var theme = 0
    
    
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView {
                
                if theme == 0 {
                    LazyVGrid (columns: [GridItem(.adaptive(minimum: 100, maximum: 110))]) {
                        ForEach(animals[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    } .foregroundColor(.orange)
                }
                else if theme == 1 {
                    LazyVGrid (columns: [GridItem(.adaptive(minimum: 100, maximum: 110))]) {
                        ForEach(flags[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    } .foregroundColor(.blue)
                }
                else if theme == 2 {
                    LazyVGrid (columns: [GridItem(.adaptive(minimum: 100, maximum: 110))]) {
                        ForEach(food[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    } .foregroundColor(.green)
                }
                
            }
            Spacer()
            HStack {
                animalsButton
                Spacer()
                flagsButton
                Spacer()
                foodButton
            }
            
            .foregroundColor(.red)
        }
        
        //        .foregroundColor(.yellow)
        .padding()
    }
    
    
    var flagsButton: some View {
        Button(action: {
            flags.shuffle()
            
            theme = 1
        },
               label: {
            VStack {
                Image(systemName: "flag.circle").font(.largeTitle)
            Text("Flags").font(.footnote)
            }}
        )}
    var foodButton: some View {
        Button(action: {
            food.shuffle()
            
            theme = 2
        },
               label: {
            
            VStack {
                Image(systemName: "fork.knife.circle").font(.largeTitle)
                Text("Food").font(.footnote)
            }
        }
        )}
    
    var animalsButton: some View {
        Button(action: {
            animals.shuffle()
            
            theme = 0
        },
               label: {
            VStack {
                Image(systemName: "pawprint.circle").font(.largeTitle)
                Text("Animals").font(.footnote)
            }
        }
        )}
    
}





//    var add: some View {
//        Button(action: {
//            if emojiCount < emojis.count {
//                emojiCount+=1 }
//        },
//               label: {Image(systemName: "plus.square").font(.largeTitle)})
//    }
//    var remove: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount-=1 }
//        },
//               label: {Image(systemName:"minus.square").font(.largeTitle)})
//    }
//}


struct CardView: View {
    
    var content: String
    @State var isFaceUp: Bool = false
    
    let shape = RoundedRectangle(cornerRadius: 20)
    
    var body: some View {
        ZStack {
            if isFaceUp {
                shape
                    .fill()
                //                        .foregroundColor(.orange)
                    .accessibilityIdentifier(".")
                shape
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
                
            } else {
                shape
                    .fill()
                //                        .foregroundColor(.orange)
                    .accessibilityIdentifier(".")
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPod touch (7th generation)")
                .preferredColorScheme(.light)
                .previewInterfaceOrientation(.portrait)
            
        }
    }
}

