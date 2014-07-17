//
//  Example.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Example : ExampleBase {
    
    var block: SleipnirBlock
    var state: Observable<ExampleState>
    var specFailure: SpecFailure?
    
    init(_ label: String, _ block: SleipnirBlock) {
            self.block = block
            self.state = Observable<ExampleState>(value: ExampleState.Incomplete)
            super.init(label)
    }
    
    override func runWithDispatcher(dispatcher: ReportDispatcher) {
        dispatcher.runWillStartExample(self)
        
        if !shouldRun() {
            setState(ExampleState.Skipped)
        } else {
            if parent { parent!.runBeforeEach() }
            Runner.currentExample = self
            block()
            if parent { parent!.runAfterEach() }
            
            if !failed() {
                setState(ExampleState.Passed)
            }
        }
        
        dispatcher.runDidFinishExample(self)
    }
    
    func setState(state: ExampleState) {
        self.state.update(state)
    }
    
    func failed() -> Bool {
        return self.state.get() == ExampleState.Failed
            || self.state.get() == ExampleState.Error
    }
    
    func message() -> String {
        if specFailure {
            return specFailure!.reason
        } else {
            return ""
        }
    }
    
    func failure() -> String {
        if specFailure {
            return specFailure!.failure()
        } else {
            return ""
        }
    }
    
    func fullText() -> String {
        if parent {
            return parent!.fullText() + " " + self.label
        } else {
            return self.label
        }
    }
}

func it(label: String, block: () -> ()) {
    var example = Example(label, block)
    SpecTable.handleExample(example)
}

func fit(label: String, block: () -> ()) {
    var example = Example(label, block)
    example.focused = true
    SpecTable.handleExample(example)
}

func xit(label: String, block: () -> ()) {
    var example = Example(label, block)
    SpecTable.handleExample(example)
}