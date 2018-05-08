//
//  CardViewExtension.swift
//  Set
//
//  Created by Radosław Serek on 08.05.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

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
