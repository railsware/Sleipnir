//
//  Dumper.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public struct Dumper {
    
    public static func dump() {
        for exampleGroup in SpecTable.topLevelGroups {
            dumpExampleGroup(exampleGroup)
        }
    }
    
    private static func dumpExampleGroup(group: ExampleGroup, level: Int = 0) {
        printWithPadding("ExampleGroup: \(group.label)", level: level)
        
        printWithPadding("beforeAll: \(group.beforeAllBlocks.count)", level: level)
        printWithPadding("afterAll: \(group.afterAllBlocks.count)", level: level)
        
        printWithPadding("beforeEach: \(group.beforeEachBlocks.count)", level: level)
        printWithPadding("afterEach: \(group.afterEachBlocks.count)", level: level)
        
        printWithPadding("examples: \(group.examples.count)", level: level)
        
        for exampleGroup in group.childGroups {
            println()
            dumpExampleGroup(exampleGroup, level: level + 1)
        }
    }
    
    private static func printWithPadding(string: String, level: Int) {
        var spaces = level * 2
        var padding = String(count: spaces, repeatedValue: Character(" "))
        println(padding + string)
    }
}