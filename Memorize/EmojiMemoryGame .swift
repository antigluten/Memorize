//
//  EmojiMemoryGame .swift
//  Memorize
//
//  Created by Vladimir Gusev on 31.10.2021.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚗", "🚕", "🚅", "🚒", "🚘", "🚙", "🛻", "🛵", "🏍️", "🏎️", "🚜", "🛴", "🛹", "🚂", "✈️", "🚄", "🚈", "🚁", "🛶", "🚤", "⛴", "🚀"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        })
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>  {
        return model.cards
    }
}
