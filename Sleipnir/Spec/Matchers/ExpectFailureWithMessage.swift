//
//  ExpectFailureWithMessage.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/11/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func expectFailureWithMessage(message: String, block: SleipnirBlock,
        file: String = __FILE__, line: Int = __LINE__) {
    let currentExample = Runner.currentExample
    let fakeExample = Example("I am fake", {})
    Runner.currentExample = fakeExample
    
    func updateCurrentExample(state: ExampleState, specFailure: SpecFailure? = nil) {
        if specFailure {
            currentExample!.specFailure = specFailure
        }
        currentExample!.setState(state)
        Runner.currentExample = currentExample
    }
    
    block()
            
    if fakeExample.failed() {
        if !(message == fakeExample.message()) {
            let reason =
                "Expected failure message: \(message) but received failure message \(fakeExample.message())"
            let specFailure = SpecFailure(reasonRaw: reason, fileName: file, lineNumber: line)
            updateCurrentExample(ExampleState.Failed, specFailure: specFailure)
        } else {
            updateCurrentExample(ExampleState.Passed)
        }
    } else {
        let reason = "Expectation should have failed"
        let specFailure = SpecFailure(reasonRaw: reason, fileName: file, lineNumber: line)
        updateCurrentExample(ExampleState.Failed, specFailure: specFailure)
    }
}