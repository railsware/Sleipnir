//
//  BeginWith.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeginWith<S: Sequence, T: Equatable where S.GeneratorType.Element == T> : BaseMatcher<S> {

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
        return "begin with <\(stringify(expected))>"
    }
    
    private func matchString(actual: String, expected: String) -> Bool {
        let range = actual.rangeOfString(expected)
        if !range {
            return false
        }
        
        return range!.startIndex == actual.startIndex
    }
    
    private func matchSequence(actual: S, expected: S) -> Bool {
        var actualGenerator = actual.generate()
        var expectedGenerator = expected.generate()
        return actualGenerator.next() == expectedGenerator.next()
    }
}

public func beginWith<S: Sequence, T: Equatable where S.GeneratorType.Element == T>(items: S) -> BeginWith<S, T> {
    return BeginWith(items: items)
}

public func beginWith<T: Equatable>(items: T...) -> BeginWith<[T], T> {
    return BeginWith(items: items)
}