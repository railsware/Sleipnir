//
//  Example.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Example : ExampleBase {
    
    var type: ExampleType
    var block: SleipnirBlock
    var group: ExampleGroup!
    var state: Observable<ExampleState>
    var specFailure: SpecFailure?
    
    init(_ label: String,
        _ block: SleipnirBlock,
        _ type: ExampleType = ExampleType.Normal) {
            self.block = block
            self.type = type
            self.state = Observable<ExampleState>(value: ExampleState.Incomplete)
            super.init(label)
    }
    
    override func runWithDispatcher(dispatcher: ReportDispatcher) {
        dispatcher.runWillStartExample(self)
        
        if group { group.runBeforeEach() }
        Runner.currentExample = self
        block()
        if group { group.runAfterEach() }
        
        if !failed() {
            setState(ExampleState.Passed)
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
        if group {
            return group.fullText() + " " + self.label
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
    var example = Example(label, block, ExampleType.Focused)
    SpecTable.handleExample(example)
}

func xit(label: String, block: () -> ()) {
    var example = Example(label, block, ExampleType.Excluded)
    SpecTable.handleExample(example)
}