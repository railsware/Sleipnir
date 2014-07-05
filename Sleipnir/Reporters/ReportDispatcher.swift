//
//  ReportDispatcher.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ReportDispatcher {
    
    var reporters: Reporter[]
    
    init(with reporters: Reporter[]) {
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
    
    func runWillStartWithGroup(group: Internal.ExampleGroup) {
        for reporter in reporters {
            reporter.runWillStartWithGroup(group)
        }
    }
    
    func runDidCompleteWithGroup(group: Internal.ExampleGroup) {
        for reporter in reporters {
            reporter.runDidCompleteWithGroup(group)
        }
    }

}