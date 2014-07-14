//
//  Equal.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Equal<T: Equatable>: BaseMatcher<T> {
    
    init(expected: T) {
        super.init(expected: expected)
    }
    
    init(expected: [T]) {
        super.init(expected: expected)
    }
    
    override func match(actual: T) -> Bool {
        return actual == self.expected[0]
    }
    
    override func match(actual: [T]) -> Bool {
        return actual == self.expectedArr!
    }
    
    override func failureMessageEnd() -> String {
        if expectedArr {
            return "equal \(expectedArr!)"
        } else {
            return "equal \(expected)"
        }
    }
}

func equal<T>(expected: T) -> Equal<T> {
    return Equal(expected: expected)
}

func equal<T: Equatable>(expected: [T]) -> Equal<T> {
    return Equal(expected: expected)
}
