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
    
    var arrValue: T[]?

    init(value: T) {
        self.value.append(value)
    }
    
    init(arrValue: T[]) {
        self.arrValue = arrValue
    }
    
    func to(matcher: BaseMatcher<T>) {
        if (exampleFailed()) {
            return
        }
        
        if !match(matcher) {
            fail(matcher)
        }
    }
    
    func notTo(matcher: BaseMatcher<T>) {
        if (exampleFailed()) {
            return
        }
        
        if match(matcher) {
            fail(matcher)
        }
    }
    
    // Private
    
    func fail(matcher: BaseMatcher<T>) {
        var specFailure = SpecFailure(reason: matcher.failureMessage())
        Runner.currentExample!.specFailure = specFailure
        Runner.currentExample!.setState(Internal.ExampleState.Failed)
    }
    
    func match(matcher: BaseMatcher<T>) -> Bool {
        if arrValue {
            return matcher.match(arrValue!)
        } else {
            return matcher.match(value[0])
        }
    }
    
    func exampleFailed() -> Bool {
        return Runner.currentExample!.failed()
    }
}

func expect<T>(value: T) -> ActualValue<T> {
    return ActualValue(value: value)
}

func expect<T>(arrValue: T[]) -> ActualValue<T> {
    return ActualValue(arrValue: arrValue)
}