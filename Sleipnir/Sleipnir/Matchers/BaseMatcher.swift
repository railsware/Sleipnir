//
//  BaseMatcher.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BaseMatcher<T> {
    
    var expected: T?
    
    var expectedArr: [T]?
    
    init() {
    }
    
    init(expected: T) {
        self.expected = expected
    }
    
    init(expected: [T]) {
        self.expectedArr = expected
    }
    
    func match(actual: T) -> Bool {
        return false
    }
    
    func match(actual: [T]) -> Bool {
        return false
    }
    
    func failureMessageEnd() -> String {
        return ""
    }
    
    /// Private
    
    func failureMessageFor(value: T) -> String {
        return "Expected <\(value)> to \(failureMessageEnd())"
    }
    
    func failureMessageFor(value: [T]) -> String {
        return "Expected <\(value)> to \(failureMessageEnd())"
    }
    
    func negativeFailureMessageFor(value: T) -> String {
        return "Expected <\(value)> to not \(failureMessageEnd())"
    }
    
    func negativeFailureMessageFor(value: [T]) -> String {
        return "Expected <\(value)> to not \(failureMessageEnd())"
    }
}