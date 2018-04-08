//
//  Card.swift
//  Set
//
//  Created by Radosław Serek on 20.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

struct Card: Equatable, Hashable
{
    var hashValue: Int {
        return number.rawValue + symbol.rawValue + shading.rawValue + color.rawValue
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.color == rhs.color && lhs.number == rhs.number && lhs.shading == rhs.shading && lhs.symbol == rhs.symbol
    }
    
    let number: Number
    let symbol: Symbol
    let shading: Shading
    let color: Color
    
    enum Number: Int {
        case one = 1
        case two = 2
        case three = 3
        
        static let all = [Number.one, .two, .three]
    }
    
//    enum Symbol: Int {
//        case diamond = 10
//        case squiggle = 20
//        case oval = 30
//
//        static let all = [Symbol.diamond, .squiggle, .oval]
//    }
    
    enum Symbol: Int {
        case circle = 10
        case triangle = 20
        case square = 30
        
        static let all = [Symbol.circle, .triangle, .square]
    }
    
    enum Shading: Int {
        case solid = 100
        case striped = 200
        case open = 300
        
        static let all = [Shading.solid, .striped, .open]
    }
    
    enum Color: Int {
        case red = 1000
        case green = 2000
        case purple = 3000
        
        static let all = [Color.red, .green, .purple]
    }
    
//    struct CardHashValues {
//        static let numberHashValues = [1,2,3]
//        static let symbolHashValues = [10,20,30]
//        static let shadingHashValues = [100,200,300]
//        static let colorHashValues = [1000,2000,3000]
//    }
    
    
}
