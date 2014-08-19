//
//  Example.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public typealias SleipnirBlock = () -> ()

public let PENDING : SleipnirBlock? = nil

class Example : ExampleBase {
    
    var block: SleipnirBlock!
    var state: Observable<ExampleState>
    var specFailure: SpecFailure?
    
    init(_ label: String, _ block: SleipnirBlock?) {
        if block != nil {
            self.block = block!
        }
        self.state = Observable<ExampleState>(value: ExampleState.Incomplete)
        super.init(label)
    }
    
    override func runWithDispatcher(dispatcher: ReportDispatcher) {
        dispatcher.runWillStartExample(self)
        
        if !shouldRun() {
            setState(ExampleState.Skipped)
        } else if isPending() {
            setState(ExampleState.Pending)
        } else {
            if parent != nil {
                parent!.runBeforeEach()
            }
            Runner.currentExample = self
            block()
            if parent != nil {
                parent!.runAfterEach()
            }
            
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
    
    func isPending() -> Bool {
        if block == nil {
            return true
        }
        
        return false
    }
    
    func message() -> String {
        if specFailure != nil {
            return specFailure!.reason
        } else {
            return ""
        }
    }
    
    func failure() -> String {
        if specFailure != nil {
            return specFailure!.failure()
        } else {
            return ""
        }
    }
    
    func fullText() -> String {
        if parent != nil {
            return parent!.fullText() + " " + self.label
        } else {
            return self.label
        }
    }
}

public func it(label: String, block: SleipnirBlock?) {
    var example = Example(label, block)
    SpecTable.handleExample(example)
}

public func fit(label: String, block: SleipnirBlock) {
    var example = Example(label, block)
    example.focused = true
    SpecTable.handleExample(example)
}

public func xit(label: String, block: SleipnirBlock) {
    it(label, PENDING)
}