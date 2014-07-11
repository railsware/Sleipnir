//
//  ExampleBase.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/7/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

typealias SleipnirBlock = () -> ()

enum ExampleType : Printable {
    case Normal
    case Focused
    case Excluded
    
    var description: String {
        switch (self) {
        case .Normal: return "Normal"
        case .Focused: return "Focused"
        case .Excluded: return "Excluded"
        default: return "ExampleType"
        }
    }
}

enum ExampleState : Printable {
    case Incomplete
    case Skipped
    case Passed
    case Failed
    case Error
    
    var description: String {
        switch (self) {
        case .Incomplete: return "Incomplete"
        case .Skipped: return "Skipped"
        case .Passed: return "Passed"
        case .Failed: return "Failed"
        case .Error: return "Error"
        default: return "ExampleState"
        }
    }
}

class ExampleBase {
    
    var label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    func runWithDispatcher(dispatcher: ReportDispatcher) {
    }
    
    func hasChildren() -> Bool {
        return false
    }
}