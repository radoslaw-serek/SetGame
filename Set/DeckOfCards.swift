//
//  DeckOfCards.swift
//  Set
//
//  Created by Radosław Serek on 20.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

struct DeckOfCards
{
    let cards: [Card]
    
    init() {
        var deck = [Card]()
        for number in Card.Number.all {
            for symbol in Card.Symbol.all {
                for shading in Card.Shading.all {
                    for color in Card.Color.all {
                        deck.append(Card(number: number, symbol: symbol, shading: shading, color: color))
                    }
                }
            }
        }
        deck.shuffle()
        self.cards = deck
    }
    
    
}
