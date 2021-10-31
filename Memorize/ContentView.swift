//
//  ContentView.swift
//  Memorize
//
//  Created by Vladimir Gusev on 18.10.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "🚕", "🚅", "🚒", "🚘", "🚙", "🛻", "🛵", "🏍️", "🏎️", "🚜", "🛴", "🛹", "🚂", "✈️", "🚄", "🚈", "🚁", "🛶", "🚤", "⛴", "🚀"]
    
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

