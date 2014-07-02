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
        
        executePositiveMatch(matcher)
    }
    
    func notTo(matcher: BaseMatcher<T>) {
        if (exampleFailed()) {
            return
        }
        
        executeNegativeMatch(matcher)
    }
    
    // Private
    
    func executePositiveMatch(matcher: BaseMatcher<T>) {
        if !match(matcher) {
            var reason: String
            if arrValue {
                reason = matcher.failureMessageFor(arrValue!)
            } else {
                reason = matcher.failureMessageFor(value[0])
            }
            
            fail(reason)
        }
    }
    
    func executeNegativeMatch(matcher: BaseMatcher<T>) {
        if match(matcher) {
            var reason: String
            if arrValue {
                reason = matcher.negativeFailureMessageFor(arrValue!)
            } else {
                reason = matcher.negativeFailureMessageFor(value[0])
            }
            
            fail(reason)
        }
    }
    
    func fail(reason: String) {
        var specFailure = SpecFailure(reason: reason)
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