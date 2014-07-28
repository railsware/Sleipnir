//
//  Array.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/19/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        for var i = self.count - 1; i >= 1; i-- {
            let j = Int(random() % (i+1))
            swap(&self[i], &self[j])
        }
    }
    
}

extension Array : Equatable { }

public func ==<T>(lhs: Array<T>, rhs: Array<T>) -> Bool {
    return lhs.bridgeToObjectiveC() == rhs.bridgeToObjectiveC()
}