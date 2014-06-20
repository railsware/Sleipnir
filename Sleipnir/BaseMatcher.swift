//
//  BaseMatcher.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BaseMatcher<T: NSObject> {
    
    var expected: T
    
    init(expected: T) {
        self.expected = expected
    }
    
    func failureMessage() -> String {
        return "FAIL"
    }
    
    func match(expected: T, actual: T) -> Bool {
        return false
    }
    
}