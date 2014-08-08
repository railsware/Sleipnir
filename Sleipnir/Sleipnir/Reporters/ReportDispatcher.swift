//
//  ReportDispatcher.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ReportDispatcher {
    
    var reporters: [Reporter]
    
    init(with reporters: [Reporter]) {
        self.reporters = reporters
    }
    
    func runWillStart(randomSeed seed: Int) {
        for reporter in reporters {
            reporter.runWillStart(randomSeed: seed)
        }
    }
    
    func runDidComplete() {
        for reporter in reporters {
            reporter.runDidComplete()
        }
    }
    
    func runWillStartExampleGroup(group: ExampleGroup) {
        for reporter in reporters {
            reporter.runWillStartExampleGroup(group)
        }
    }
    
    func runDidFinishExampleGroup(group: ExampleGroup) {
        for reporter in reporters {
            reporter.runDidFinishExampleGroup(group)
        }
    }

    func runWillStartExample(example: Example) {
        for reporter in reporters {
            reporter.runWillStartExample(example)
        }
    }
    
    func runDidFinishExample(example: Example) {
        for reporter in reporters {
            reporter.runDidFinishExample(example)
        }
    }
    
    func result() -> Int {
        var result = 0
        
        for reporter in reporters {
            result |= reporter.result()
        }
        
        return result
    }
}