//
//  ActualValue.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class ActualValue<T> {
    
    var value: T?
    
    var fileName: String
    var lineNumber: Int

    init(value: T?, fileName: String, lineNumber: Int) {
        self.value = value
        self.fileName = fileName
        self.lineNumber = lineNumber
    }
    
    public func to(matcher: BaseMatcher<T>) {
        if (exampleFailed()) {
            return
        }
        
        executePositiveMatch(matcher)
    }
    
    public func toNot(matcher: BaseMatcher<T>) {
        if (exampleFailed()) {
            return
        }
        
        executeNegativeMatch(matcher)
    }
    
    private func executePositiveMatch(matcher: BaseMatcher<T>) {
        if !matcher.match(value) {
            let reason = matcher.failureMessageFor(value)
            fail(reason)
        }
    }
    
    private func executeNegativeMatch(matcher: BaseMatcher<T>) {
        if matcher.match(value) {
            let reason = matcher.negativeFailureMessageFor(value)
            fail(reason)
        }
    }
    
    private func fail(reason: String) {
        let specFailure = SpecFailure(reasonRaw: reason, fileName: fileName, lineNumber: lineNumber)
        Runner.currentExample!.specFailure = specFailure
        Runner.currentExample!.setState(ExampleState.Failed)
    }
    
    private func exampleFailed() -> Bool {
        return Runner.currentExample!.failed()
    }
}

public func expect<T>(@autoclosure expression:  () -> T?, file: String = #file, line: Int = #line) -> ActualValue<T> {
    return ActualValue(value: expression(), fileName: file, lineNumber: line)
}

public func expect<T>(file: String = #file, line: Int = #line, expression: () -> T?) -> ActualValue<T> {
    return ActualValue(value: expression(), fileName: file, lineNumber: line)
}

public func fail(message: String, file: String = #file, line: Int = #line) {
    let specFailure = SpecFailure(reasonRaw: message, fileName: file, lineNumber: line)
    Runner.currentExample!.specFailure = specFailure
    Runner.currentExample!.setState(ExampleState.Failed)
}