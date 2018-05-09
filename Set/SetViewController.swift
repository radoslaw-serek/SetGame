//
//  ViewController.swift
//  Set
//
//  Created by Radosław Serek on 20.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

class SetViewController: UICollectionViewController {

    @IBOutlet weak var setCollectionView: UICollectionView! {
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(addThreeMoreCards))
            swipe.direction = .down
            setCollectionView.addGestureRecognizer(swipe)
            
            let rotation = UIRotationGestureRecognizer(target: self, action: #selector(reshuffleTheCards))
            setCollectionView.addGestureRecognizer(rotation)
        }
    }
    
    let game = SetGame()
    
    private var symbol: String?
    
    private let reuseIdentifier = "CardCell"
    private let cardsPerRow: CGFloat = 3
    private let columns: CGFloat = 8
    private let inset: CGFloat = 50
    private lazy var sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.startGame()
        setCollectionView?.allowsMultipleSelection = true
        
        updateUI()

    }
    
    @objc private func addThreeMoreCards() {
        game.addThreeMoreCards()
        updateUI()
    }
    
    @objc private func reshuffleTheCards(byHandlingGestureRecognizedBy recognizer: UIRotationGestureRecognizer) {
        
        switch recognizer.state {
        case .ended,.changed:
            game.reshuffle()
            updateUI()
        default: break
        }
    }
    
    private func updateUI() {
        setCollectionView.reloadData()
    }
    
    private func makeDisplayedTextOnCard (card: Card) -> NSAttributedString {
        
        let symbol = card.symbol.symbolValue()
        let color = card.color.colorValue()
        let shadedColor = color.withAlphaComponent(card.shading.shadingValue())
        let number = card.number.numberValue()
        let displayedSymbol = String(repeating: symbol, count: number)
        let displayedText = NSAttributedString(
            string: displayedSymbol,
            attributes:[
                .font : UIFont.boldSystemFont(ofSize: 25),
                .foregroundColor : shadedColor,
                .strokeColor : color,
                .strokeWidth : -3.0
            ]
        )
        
        return displayedText
    }
}

extension SetViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpaceHeight = (inset / 2) * (columns - 1)
        let availableHeight = view.frame.height - paddingSpaceHeight
        let heightPerItem = availableHeight / columns
        
        return CGSize(width: heightPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (inset / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
}

extension SetViewController {
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
            let footerView = setCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SetFooterView", for: indexPath) as! SetGameFooterView
            footerView.delegate = self
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

extension SetViewController {
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard game.allowCardSelection else {return false}
        
        let card = game.cardsCurrentlyInGame[indexPath.row]
        return game.selectedCards.contains(card) ? false : true

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let card = game.cardsCurrentlyInGame[indexPath.row]
        game.selectedCards.append(card)
        if game.matchCards() != nil {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.updateUI()
            }
        }

    }


    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let card = game.cardsCurrentlyInGame[indexPath.row]
        
        if let selectedCardIndex = game.selectedCards.index(of: card) {
            game.selectedCards.remove(at: selectedCardIndex)
        }
    }
}

extension SetViewController: SetGameFooterViewDelegate {
//    func view(_ view: SetGameFooterView, didTapAddMoreCardButton button: UIButton) {
//        addThreeMoreCards()
//    }

    func view(_ view: SetGameFooterView, didTapStartNewGameButton button: UIButton) {
        game.resetGame()
        updateUI()
    }
    
    
    
}
