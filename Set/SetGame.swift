//
//  SetGame.swift
//  Set
//
//  Created by Radosław Serek on 20.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

class SetGame
{
    
    //var matchedCards = [Card]()
    var selectedCards = [Card]()
    var cardsInGame: [Card]
    
    init() {
        self.cardsInGame = DeckOfCards().cards
    }
    
    func matchCards() {
        guard selectedCards.count == 3 else { return }
        
        let colorsMatching = isDimensionMatching(array: selectedCards) { $0.color.rawValue }
        let numbersMatching = isDimensionMatching(array: selectedCards) { $0.number.rawValue}
        let shadingsMatching = isDimensionMatching(array: selectedCards) {$0.shading.rawValue}
        let symbolsMatching = isDimensionMatching(array: selectedCards) {$0.symbol.rawValue}
        
        if colorsMatching, numbersMatching, shadingsMatching, symbolsMatching {
            for card in selectedCards {
                if let index = cardsInGame.index(of: card) {
                    cardsInGame.remove(at: index)
                }
            }
            selectedCards.removeAll()
        }
    }
    
    private func isDimensionMatching(array: [Card], dimensionSelector: ((Card) -> Int)) -> Bool {
        let dimensions = Set(array.map(dimensionSelector))
        //if set.count == 1 - all elements of array are matching, if set.count == 3 the all elements of array are different
        return dimensions.count != 2
    }
    
    
}

