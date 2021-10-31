//
//  ContentView.swift
//  Memorize
//
//  Created by Vladimir Gusev on 18.10.2021.
//

import SwiftUI

struct ContentView: View {
    /// Task 4: theme choosing buttons
    var vehicles = ["🚗", "🚕", "🚅", "🚒", "🚘", "🚙", "🛻", "🛵", "🏍️", "🏎️", "🚜", "🛴", "🛹"]
    var natureEmoji = ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌆", "🌃"]
    var humanEmoji = ["👮🏻‍♀️", "🧑🏻‍💻", "🕵🏻‍♀️", "👨🏻‍🏫", "🕵🏿‍♂️", "👩🏽‍🚀", "👨🏻‍💻", "👨🏻‍✈️"]
    
    @State var emojis = ["🚗", "🚕", "🚅", "🚒", "🚘", "🚙", "🛻", "🛵", "🏍️", "🏎️", "🚜", "🛴", "🛹"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            /// Task 3: Add title "Memorize" at the top
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            
            // Task 2: remove buttons from the bottom of the screen, solution: just comment
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
            /// Task 4: Add 3 theme choosing buttons
            HStack {
                Spacer()
                vehicle
                Spacer()
                nature
                Spacer()
                human
                Spacer()
            }
            
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    
    var vehicle: some View {
        Button {
            // it solves the problem with the different number of symbols
//            if emojiCount > vehicles.count {
//                emojiCount = vehicles.count
//            }
            // Extra task 1
            emojiCount = Int.random(in: 4...vehicles.count)
            emojis = vehicles
            /// task 6: shuffle every touch on buttons with shuffle method
            emojis.shuffle()
        } label: {
            /// task 7: add image and text to the button
            VStack {
                /// task 8: use sf symbols to represent a theme idea
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicles")
                /// task 9: add font size to the text
                    .font(.caption)
            }
        }
    }
    
    var nature: some View {
        Button {
            // it solves the problem with the different number of symbols
//            if emojiCount > natureEmoji.count {
//                emojiCount = natureEmoji.count
//            }
            emojiCount = Int.random(in: 4...natureEmoji.count)
            emojis = natureEmoji
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "tortoise")
                    .font(.largeTitle)
                Text("Nature")
                    .font(.caption)
            }
        }
    }
    
    var human: some View {
        Button {
            // it solves the problem with the different number of symbols
//            if emojiCount > humanEmoji.count {
//                emojiCount = humanEmoji.count
//            }
            
            emojiCount = Int.random(in: 4...humanEmoji.count)
            emojis = humanEmoji
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "person")
                    .font(.largeTitle)
                Text("Human")
                    .font(.caption)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
