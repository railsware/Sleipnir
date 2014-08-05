//
//  EndWith.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class EndWith<S: SequenceType, T: Equatable where S.Generator.Element == T> : BaseMatcher<S> {
    
    init(items: S) {
        super.init(expected: items)
    }
    
    override func match(actual: S?) -> Bool  {
        if actual == nil {
            return false
        }
        
        if (actual is String && expected is String) {
            return matchString(actual as String, expected: expected as String)
        } else {
            return matchSequence(actual!, expected: expected!)
        }
    }
    
    override func failureMessageEnd() -> String {
        return "end with <\(stringify(expected))>"
    }
    
    private func matchString(actual: String, expected: String) -> Bool {
        let range = actual.rangeOfString(expected)
        if range == nil {
            return false
        }
        
        return range!.endIndex == actual.endIndex
    }
    
    private func matchSequence(actual: S, expected: S) -> Bool {
        var actualGenerator = actual.generate()
        var expectedGenerator = expected.generate()
        
        var expectedLastItem = expectedGenerator.next()
        var lastItem: T?
        while let item = actualGenerator.next() {
            lastItem = item
        }
        
        return lastItem == expectedLastItem
    }
}

public func endWith<S: SequenceType, T: Equatable where S.Generator.Element == T>(items: S) -> EndWith<S, T> {
    return EndWith(items: items)
}

public func endWith<T: Equatable>(items: T...) -> EndWith<[T], T> {
    return EndWith(items: items)
}