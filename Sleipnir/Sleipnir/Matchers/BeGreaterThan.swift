//
//  File.swift
//  Sleipnir
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeGreaterThan<T: Comparable> : BaseMatcher<T> {
    
    init(expected: T?) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
        return actual > expected
    }
    
    override func failureMessageEnd() -> String {
        return "be greater than <\(stringify(expected))>"
    }
}

public func beGreaterThan<T: Comparable>(expected: T?) -> BeGreaterThan<T> {
    return BeGreaterThan(expected: expected)
}
