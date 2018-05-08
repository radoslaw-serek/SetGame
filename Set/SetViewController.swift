//
//  ViewController.swift
//  Set
//
//  Created by Radosław Serek on 20.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

class SetViewController: UICollectionViewController {

    @IBOutlet weak var setCollectionView: UICollectionView!
    
    let game = SetGame()
    
    private var symbol: String?
    
    private let reuseIdentifier = "CardCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.startGame(with: 12)
        let width = (view.frame.size.width - 20) / 3
        let height = (view.frame.size.height - 70) / 8
        let layout = setCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func matchCards() {
        
    }
    
    private func addThreeMoreCards() {
        game.addMoreCards(numberOfCardsToBeAdded: 3)
        updateUI()
    }
    
    private func updateUI() {
        setCollectionView.reloadData()
    }
    
    private func makeDisplayedTextOnCard (card: Card) -> NSAttributedString {
        
        let symbol = card.symbol.symbolValue()
        let color = card.color.colorValue()
        let shadedColor = color.withAlphaComponent(card.shading.shadingValue())
        let number = card.number.numberValue()
        let displayedSymbol = String(describing: repeatElement(symbol, count: number))
        let displayedText = NSAttributedString(string: displayedSymbol, attributes: [NSAttributedStringKey.foregroundColor : shadedColor])
        
        return displayedText
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cardsCurrentlyInGame.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let cardCell = dequeued as? CardCollectionViewCell else { return UICollectionViewCell() }
        cardCell.displayedSymbol = makeDisplayedTextOnCard(card: game.cardsCurrentlyInGame[indexPath.row])
        return cardCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionFooter:
            let footerView = setCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SetFooterView", for: indexPath)
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }


}

extension Card.Color {
    func colorValue() -> UIColor {
        switch self {
        case .green: return .green
        case .purple: return .purple
        case .red: return .red
        }
    }
}

extension Card.Number {
    func numberValue() -> Int {
        switch self {
        case .one: return 1
        case .two: return 2
        case .three: return 3
        }
    }
}

extension Card.Shading {
    func shadingValue() -> CGFloat {
        switch self {
        case .open: return 0.0
        case .solid: return 1.0
        case .striped: return 0.15
        }
    }
}

extension Card.Symbol {
    func symbolValue() -> String {
        switch self {
        case .circle: return "⚫︎"
        case .square: return "◼︎"
        case .triangle: return "▲"
        }
    }
}


