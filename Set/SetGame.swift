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
    
    private(set) var selectedCards = [Card]()
    private(set) var cardsCurrentlyInGame = [Card]()
    private(set) var cardsLeftInDeck: [Card]
    
    init() {
        self.cardsLeftInDeck = DeckOfCards().cards
    }
    
    func startGame(with numberOfCards: Int) {
        cardsCurrentlyInGame = cardsLeftInDeck.removeFirst(numberOfElements: numberOfCards)
    }
    
    func addMoreCards(numberOfCardsToBeAdded: Int) {
        cardsCurrentlyInGame.append(contentsOf: (cardsLeftInDeck.removeFirst(numberOfElements: numberOfCardsToBeAdded)))
    }
    
    func matchCards() {
        guard selectedCards.count == 3 else { return }
        
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
        }
    }
    
    func resetGame() {
        
    }
    
    private func isDimensionMatching(array: [Card], dimensionSelector: ((Card) -> Int)) -> Bool {
        let dimensions = Set(array.map(dimensionSelector))
        //if set.count == 1 - all elements of array are matching, if set.count == 3 the all elements of array are different
        return dimensions.count != 2
    }
    
    
}


