//
//  Array+removeFirst.swift
//  Set
//
//  Created by Radosław Serek on 08.04.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

extension Array {
    mutating func removeFirst(numberOfElements n: Int) -> Array<Element> {
        var array = Array<Element>()
        for _ in 0..<n {
            array.append(self.removeFirst())
            
        }
        return array
    }
}
