//
//  CardCollectionViewCell.swift
//  Set
//
//  Created by Radosław Serek on 25.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardCell: UILabel!
    
    var displayedSymbol: String? {
        didSet {
            if displayedSymbol != nil {
                cardCell.text = displayedSymbol
            }
        }
    }
}
