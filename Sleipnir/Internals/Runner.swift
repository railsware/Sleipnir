//
//  Runner.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/19/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

struct Runner {
    
    enum RunOrder {
        case Normal
        case Random
    }
    
    static var currentExample: Internal.Example?
    static var order = RunOrder.Random
    static var dispatcher: ReportDispatcher?
    
    static func run(runOrder: RunOrder = RunOrder.Random, seed: Int? = nil) {
        let specs = Internal.specTable
        
        order = runOrder
        if (order == RunOrder.Random) {
            if seed {
                srandom(UInt32(seed!))
            } else {
                srandomdev()
            }
            
            specs.topLevelGroups.shuffle()
        }
        
        dispatcher = ReportDispatcher(with: getReporters())
        dispatcher!.runWillStart()
        
        for exampleGroup in specs.topLevelGroups {
            runExampleGroup(exampleGroup)
        }
        
        dispatcher!.runDidComplete()
    }
    
    // Private
    
    static func runExample(example: Internal.Example) {
        currentExample = example
        
        example.group.runBeforeEach()
        example.block()
        example.group.runAfterEach()
        
        if !example.failed() {
            example.setState(Internal.ExampleState.Passed)
        }
    }
    
    static func runExampleGroup(group: Internal.ExampleGroup) {
        if (order == RunOrder.Random) {
            group.examples.shuffle()
            group.childGroups.shuffle()
        }
        
        dispatcher!.runWillStartWithGroup(group)
        
        for beforeAll in group.beforeAllBlocks {
            beforeAll()
        }
        
        for example in group.examples {
            runExample(example)
        }
        
        for afterAll in group.afterAllBlocks {
            afterAll()
        }
        
        dispatcher!.runDidCompleteWithGroup(group)
        
        for childGroup in group.childGroups {
            runExampleGroup(childGroup)
        }
    }
    
    // TODO provide a way to define and load custom reporters
    static func getReporters() -> Reporter[] {
        var reporters = Reporter[]()
        reporters.append(DefaultReporter())
        return reporters
    }

}