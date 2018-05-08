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
    
    var selectedCards = [Card]()
    private let startingAmountOfCards = 12
    private let maxAmountOfCards = 24
    
    private(set) var cardsCurrentlyInGame = [Card]()
    private(set) var cardsLeftInDeck: [Card]
    
    var allowCardSelection: Bool {
        return !(selectedCards.count > 2)
    }
    
    init() {
        self.cardsLeftInDeck = DeckOfCards().cards
    }
    
    func startGame() {
        cardsCurrentlyInGame = cardsLeftInDeck.removeFirst(numberOfElements: startingAmountOfCards)
    }
    
    func addThreeMoreCards() {
        if cardsCurrentlyInGame.count < maxAmountOfCards {
        cardsCurrentlyInGame.append(contentsOf: (cardsLeftInDeck.removeFirst(numberOfElements: 3)))
        }
    }
    
    func matchCards() -> Bool? {
        guard selectedCards.count == 3 else { return nil}
        
        let colorsMatching = isDimensionMatching(array: selectedCards) { $0.color.rawValue }
        let numbersMatching = isDimensionMatching(array: selectedCards) { $0.number.rawValue}
        let shadingsMatching = isDimensionMatching(array: selectedCards) {$0.shading.rawValue}
        let symbolsMatching = isDimensionMatching(array: selectedCards) {$0.symbol.rawValue}
        
        if colorsMatching, numbersMatching, shadingsMatching, symbolsMatching {
            for card in selectedCards {
                if let index = cardsCurrentlyInGame.index(of: card) {
                    cardsCurrentlyInGame.remove(at: index)
                }
            }
            selectedCards.removeAll()
            if cardsCurrentlyInGame.count < 12 {
                addThreeMoreCards()
            }
            return true
        } else {
        selectedCards.removeAll()
        return false
        }
    }
    
    func resetGame() {
        cardsLeftInDeck = DeckOfCards().cards
        startGame()
        selectedCards.removeAll()
    }
    
    private func isDimensionMatching(array: [Card], dimensionSelector: ((Card) -> Int)) -> Bool {
        let dimensions = Set(array.map(dimensionSelector))
        //if set.count == 1 - all elements of array are matching, if set.count == 3 the all elements of array are different
        return dimensions.count != 2
    }
}


