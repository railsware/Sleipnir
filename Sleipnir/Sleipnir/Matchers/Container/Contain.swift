//
//  Contain.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/18/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class Contain<S: Sequence, T: Equatable where S.GeneratorType.Element == T> : BaseMatcher<S> {
    
    init(items: S) {
        super.init(expected: items)
    }
    
    override func match(actual: S?) -> Bool  {
        if !actual {
            return false
        }
        
        if (actual is String && expected is String) {
            return matchString(actual as String, expected: expected as String)
        } else {
            return matchSequence(actual!, expected: expected!)
        }
    }
    
    override func failureMessageEnd() -> String {
        return "contain <\(stringify(expected))>"
    }
    
    private func matchString(actual: String, expected: String) -> Bool {
        return actual.rangeOfString(expected) != nil
    }
    
    private func matchSequence(actual: S, expected: S) -> Bool {
        var result = true
        
        for item in expected {
            if !(contains(actual, item)) {
                result = false
            }
        }
        
        return result
    }
}

public func contain<S: Sequence, T: Equatable where S.GeneratorType.Element == T>(items: S) -> Contain<S, T> {
    return Contain(items: items)
}

public func contain<T: Equatable>(items: T...) -> Contain<[T], T> {
    return Contain(items: items)
}