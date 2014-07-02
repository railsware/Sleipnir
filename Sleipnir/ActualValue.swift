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
    
    var fileName: String
    var lineNumber: Int

    init(value: T, fileName: String, lineNumber: Int) {
        self.value.append(value)
        self.fileName = fileName
        self.lineNumber = lineNumber
    }
    
    init(arrValue: T[], fileName: String, lineNumber: Int) {
        self.arrValue = arrValue
        self.fileName = fileName
        self.lineNumber = lineNumber

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
        var specFailure = SpecFailure(reason: reason, fileName: fileName, lineNumber: lineNumber)
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

func expect<T>(value: T, file: String = __FILE__, line: Int = __LINE__) -> ActualValue<T> {
    return ActualValue(value: value, fileName: file, lineNumber: line)
}

func expect<T>(arrValue: T[], file: String = __FILE__, line: Int = __LINE__) -> ActualValue<T> {
    return ActualValue(arrValue: arrValue, fileName: file, lineNumber: line)
}