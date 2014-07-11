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
    
    static var currentExample: Example?
    
    static func run(runOrder: RunOrder = RunOrder.Random, seed: Int? = nil) {
        let specSeed = setUpRandomSeed(seed: seed)
        
        if (runOrder == RunOrder.Random) {
            shuffleExamples(SpecTable.topLevelGroups)
        }
        
        let dispatcher = ReportDispatcher(with: getReporters())
        dispatcher.runWillStart(randomSeed: specSeed)
        
        for exampleGroup in SpecTable.topLevelGroups {
            exampleGroup.runWithDispatcher(dispatcher)
        }
        
        dispatcher.runDidComplete()
    }
    
    // Private
    
    static func shuffleExamples(groups: ExampleGroup[]) {
        groups.shuffle()
        for group in groups {
            group.examples.shuffle()
            
            if (group.childGroups.count > 0) {
                shuffleExamples(group.childGroups)
            }
        }
    }
    
    // TODO provide a way to define and load custom reporters
    static func getReporters() -> Reporter[] {
        var reporters = Reporter[]()
        reporters.append(DefaultReporter())
        return reporters
    }
    
    static func setUpRandomSeed(seed: Int? = nil) -> Int {
        var specSeed: Int
        if seed {
            specSeed = seed!
        } else {
            specSeed = Int(arc4random())
        }
        srandom(UInt32(specSeed))
        
        return specSeed
    }
}