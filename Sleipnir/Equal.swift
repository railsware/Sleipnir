//
//  Equal.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Equal<T: NSObject>: BaseMatcher<T> {
    
    init(expected: T) {
        super.init(expected: expected)
    }
    
    override func failureMessage() -> String {
        return "FAIL EQUAL"
    }
    
    override func match(expected: T, actual: T) -> Bool {
        return actual == expected
    }
}

func equal<T: NSObject>(expected: T) -> Equal<T> {
    return Equal(expected: expected)
}
