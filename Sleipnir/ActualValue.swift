//
//  ActualValue.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ActualValue<T> {
    
    var value: T[] = T[]()

    init(value: T) {
        self.value.append(value)
    }
    
    func to(matcher: BaseMatcher<T>) {
        var result = matcher.match(matcher.expected[0], actual: value[0])
        if result {
            success()
        } else {
            fail(matcher)
        }
    }
    
    func fail(matcher: BaseMatcher<T>) {
        println(matcher.failureMessage())
    }
    
    func success() {
        println("SUCCESS")
    }
}

func expect<T>(value: T) -> ActualValue<T> {
    return ActualValue(value: value)
}