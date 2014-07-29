//
//  ExampleBase.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/7/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

enum ExampleState : Printable {
    case Incomplete
    case Skipped
    case Pending
    case Passed
    case Failed
    case Error
    
    var description: String {
        switch (self) {
        case .Incomplete: return "Incomplete"
        case .Skipped: return "Skipped"
        case .Pending: return "Pending"
        case .Passed: return "Passed"
        case .Failed: return "Failed"
        case .Error: return "Error"
        default: return "ExampleState"
        }
    }
}

class ExampleBase {
    
    var label: String
    var parent: ExampleGroup?
    
    var focused: Bool = false
    
    init(_ label: String) {
        self.label = label
    }
    
    func runWithDispatcher(dispatcher: ReportDispatcher) {
    }
    
    func hasChildren() -> Bool {
        return false
    }
    
    func hasFocusedExamples() -> Bool {
        return focused
    }
    
    func shouldRun() -> Bool {
        let shouldOnlyRunFocused = Runner.shouldOnlyRunFocused
        return !shouldOnlyRunFocused || (self.focused || (parent && parent!.shouldRun()))
    }
}