//
//  BeGreaterThanOrEqual.swift
//  Sleipnir
//
//  Created by Artur Termenji on 8/4/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeGreaterThanOrEqualTo<T: Comparable> : BaseMatcher<T> {
    
    override init(expected: T?) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
        return actual >= expected
    }
    
    override func failureMessageEnd() -> String {
        return "be greater than or equal to <\(stringify(expected))>"
    }
}

public func beGreaterThanOrEqualTo<T: Comparable>(expected: T?) -> BeGreaterThanOrEqualTo<T> {
    return BeGreaterThanOrEqualTo(expected: expected)
}

public func >=<T: Comparable>(actual: ActualValue<T>, expected: T?) {
    actual.to(beGreaterThanOrEqualTo(expected))
}