//
//  ViewController.swift
//  Set
//
//  Created by Radosław Serek on 20.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

class SetViewController: UICollectionViewController {

    
    let game = SetGame()
    
    private var symbol: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cardsInGame.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        if let card = dequeued as? CardCollectionViewCell {
            card.displayedSymbol = game.cardsInGame[indexPath.row]
        }
    }
    
    static let displayedSymbol: [Card:String] = [
        
    ]

}

