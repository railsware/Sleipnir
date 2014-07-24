//
//  BaseMatcher.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BaseMatcher<T> {
    
    var expected: T?
    
    init() {
    }
    
    init(expected: T?) {
        self.expected = expected
    }
    
    func match(actual: T?) -> Bool {
        return false
    }
    
    func failureMessageEnd() -> String {
        return ""
    }
    
    func failureMessageFor(value: T?) -> String {
        return "Expected <\(stringify(value))> to \(failureMessageEnd())"
    }

    func negativeFailureMessageFor(value: T?) -> String {
        return "Expected <\(stringify(value))> to not \(failureMessageEnd())"
    }
}