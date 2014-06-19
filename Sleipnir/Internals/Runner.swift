//
//  Runner.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/19/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Runner {
    
    class func run() {
        let specs = Internal.specTable
        for exampleGroup in specs.topLevelGroups {
            runExampleGroup(exampleGroup)
        }
    }
    
    // Make this function private when access modifiers are available
    class func runExample(example: Internal.Example) {
        example.group.runBeforeEach()
        example.block()
        example.group.runAfterEach()
    }
    
    // Make this function private when access modifiers are available
    class func runExampleGroup(group: Internal.ExampleGroup) {
        for beforeAll in group.beforeAllBlocks {
            beforeAll()
        }
        
        for example in group.examples {
            runExample(example)
        }
        
        for afterAll in group.afterAllBlocks {
            afterAll()
        }
        
        for childGroup in group.childGroups {
            runExampleGroup(childGroup)
        }
    }

}