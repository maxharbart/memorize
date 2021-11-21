//
//  ContentView.swift
//  Memorize!
//
//  Created by Максим Гарбарт on 13.11.2021.
//

import SwiftUI


struct ContentView: View {
    
    var animals: [String] = ["🐨", "🐵", "🐻", "🐷", "🐥", "🐴", "🦁", "🦉", "🐭", "🐶",]
    var flags: [String] = ["🇫🇮", "🇯🇵", "🇲🇽", "🇷🇺", "🇹🇼", "🇺🇦", "🇿🇦", "🇹🇭", "🇬🇧", "🇱🇹" ]
    var food: [String] = ["🥐", "🍜", "🍰", "🍗", "🍦", "🌮", "🫔", "🍝", "🥔", "🍞"]
    @State var emojiCount = 9
    @State var theme = 0
    
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView {
                
                if theme == 0 {
                    LazyVGrid (columns: [GridItem(.adaptive(minimum: 70, maximum: 90))]) {
                        ForEach(animals[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    } .foregroundColor(.orange)
                }
                else if theme == 1 {
                    LazyVGrid (columns: [GridItem(.adaptive(minimum: 80, maximum: 90))]) {
                        ForEach(flags[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    } .foregroundColor(.blue)
                }
                else if theme == 2 {
                    LazyVGrid (columns: [GridItem(.adaptive(minimum: 80, maximum: 90))]) {
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
                theme = 1
            },
                   label: {Image(systemName: "flag.circle").font(.largeTitle)}
            
        )}
        var foodButton: some View {
            Button(action: {
                theme = 2
            },
                   label: {Image(systemName: "fork.knife.circle").font(.largeTitle)}
        )}
        
        var animalsButton: some View {
            Button(action: {
                theme = 0
            },
                   label: {Image(systemName: "pawprint.circle").font(.largeTitle)}
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
    
