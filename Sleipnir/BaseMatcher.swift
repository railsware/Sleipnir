//
//  BaseMatcher.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BaseMatcher<T> {
    
    var expected: T[] = T[]()
    
    var expectedArr: T[]?
    
    init(expected: T) {
        self.expected.append(expected)
    }
    
    init(expected: T[]) {
        self.expectedArr = expected
    }
    
    func failureMessage() -> String {
        return "FAIL"
    }
    
    func match(expected: T, actual: T) -> Bool {
        return false
    }
    
    func match(expected: T[], actual: T[]) -> Bool {
        return false
    }
}