//
//  SetGameReusableView.swift
//  Set
//
//  Created by Radosław Serek on 08.04.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

protocol SetGameFooterViewDelegate: class {
//    func view(_ view: SetGameFooterView, didTapAddMoreCardButton button: UIButton)
    func view(_ view: SetGameFooterView, didTapStartNewGameButton button: UIButton)
}

class SetGameFooterView: UICollectionReusableView {
    
    weak var delegate: SetGameFooterViewDelegate?
    
//    @IBAction func addMoreCards(_ sender: UIButton) {
//        delegate?.view(self, didTapAddMoreCardButton: sender)
//    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        delegate?.view(self, didTapStartNewGameButton: sender)
    }
}
