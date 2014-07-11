//
//  BeFalse.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeFalse<T>: BaseMatcher<T> {
    
    init(expected: T) {
        super.init(expected: expected)
    }
    
    override func match(actual: T) -> Bool {
        return !(actual as Bool)
    }
    
    override func failureMessageEnd() -> String {
        return "evaluate to false"
    }
}

func beFalse() -> BeFalse<Bool> {
    return BeFalse(expected: false)
}