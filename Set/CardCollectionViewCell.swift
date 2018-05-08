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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.gray.withAlphaComponent(0.15)
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.yellow.withAlphaComponent(0.15) : UIColor.gray.withAlphaComponent(0.15)
        }
    }
    
    var displayedSymbol: NSAttributedString? {
        didSet {
            if displayedSymbol != nil {
                cardCell.attributedText = displayedSymbol
            }
        }
    }
}
