//
//  BeNil.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/16/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeNil<T> : BaseMatcher<T> {
    
    override init() {
        super.init()
    }
    
    init(expected: T) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
        return actual == nil
    }
    
    override func failureMessageEnd() -> String {
        return "be nil"
    }
}

public func beNil() -> BeNil<AnyObject> {
    return BeNil()
}