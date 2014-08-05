//
//  BeEmpty.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/22/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeEmpty<S: SequenceType> : BaseMatcher<S> {
    
    override init() {
        super.init()
    }
    
    override func match(actual: S?) -> Bool  {
        if actual == nil {
            return true
        }

        var generator = actual!.generate()
        if (generator.next() != nil) {
            return false
        } else {
            return true
        }
    }
    
    override func failureMessageEnd() -> String {
        return "be empty"
    }
}

public func beEmpty<S: SequenceType>() -> BeEmpty<S> {
    return BeEmpty()
}