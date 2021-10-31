//
//  MemoryGame.swift
//  Memorize
//
//  Created by Vladimir Gusev on 31.10.2021.
//

import Foundation

struct MemoryGame<CardContent>  {
    private(set) var cards: Array<Card>
    
    func chooseCards(_ card: Card) {
        
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add number of pairs x2 cards array
        for pairIndex in 0..<numberOfPairOfCards {
            let content: CardContent  = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
