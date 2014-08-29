//
//  BeIdenticalTo.swift
//  Sleipnir
//
//  Created by Artur Termenji on 8/29/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeIdenticalTo<T: AnyObject> : BaseMatcher<T> {
    
    override init(expected: T?) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
//        let res = 1 === 1
//        println(res)
        return false
    }
    
    override func failureMessageEnd() -> String {
        return "be identical to <\(stringify(expected))>"
    }
}

public func beIdenticalTo<T: NSObject>(expected: T?) -> BeIdenticalTo<NSObject> {
    return BeIdenticalTo(expected: expected)
}

public func ===<T: AnyObject>(actual: ActualValue<T>, expected: T?) {
//    actual.to(beIdenticalTo(expected))
}

public func !==<T: AnyObject>(actual: ActualValue<T>, expected: T?) {
//    actual.toNot(beIdenticalTo(expected))
}