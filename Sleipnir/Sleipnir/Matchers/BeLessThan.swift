//
//  BeLessThan.swift
//  Sleipnir
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeLessThan<T: Comparable> : BaseMatcher<T> {
    
    init(expected: T?) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
        return actual < expected
    }
    
    override func failureMessageEnd() -> String {
        return "be less than <\(stringify(expected))>"
    }
}

public func beLessThan<T: Comparable>(expected: T?) -> BeLessThan<T> {
    return BeLessThan(expected: expected)
}

