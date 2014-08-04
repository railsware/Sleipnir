//
//  BeLessThanOrEqualTo.swift
//  Sleipnir
//
//  Created by Artur Termenji on 8/4/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeLessThanOrEqualTo<T: Comparable> : BaseMatcher<T> {
    
    init(expected: T?) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
        return actual <= expected
    }
    
    override func failureMessageEnd() -> String {
        return "be less than or equal to <\(stringify(expected))>"
    }
}

public func beLessThanOrEqualTo<T: Comparable>(expected: T?) -> BeLessThanOrEqualTo<T> {
    return BeLessThanOrEqualTo(expected: expected)
}

public func <=<T: Comparable>(actual: ActualValue<T>, expected: T?) {
    actual.to(beLessThanOrEqualTo(expected))
}