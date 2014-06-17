//
//  Internals.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

struct Internal
{
    typealias SleipnirBlock = () -> ()
}

extension Internal {
    
    static let specTable = SpecTable()
    static var currentGroup : ExampleGroup?
    
    static func handleGroup(group: ExampleGroup) {
        
        if (currentGroup == nil) {
            currentGroup = group
            specTable.addGroup(currentGroup!)
            currentGroup?.block()
            currentGroup = nil
        } else {
            group.parentGroup = currentGroup
            currentGroup?.addChildGroup(group)
            
            currentGroup = group
            currentGroup?.block()
            currentGroup = group.parentGroup
        }
        
    }
    
    static func handleBeforeEach(block: SleipnirBlock) {
        currentGroup?.addBeforeEach(block)
    }
    
    static func handleAfterEach(block: SleipnirBlock) {
        currentGroup?.addAfterEach(block)
    }
    
    static func handleBeforeAll(block: SleipnirBlock) {
        currentGroup?.addBeforeAll(block)
    }
    
    static func handleAfterAll(block: SleipnirBlock) {
        currentGroup?.addAfterAll(block)
    }

    static func handleExample(example: Example) {
        example.group = currentGroup
        currentGroup?.addExample(example)
    }
    
}

extension Internal {
    
    class SpecTable {
        
        var topLevelGroups: ExampleGroup[] = ExampleGroup[]()
        
        func addGroup(group: ExampleGroup) {
            topLevelGroups.append(group)
        }
        
    }
    
}

extension Internal {
    
    enum ExampleType {
        case Normal
        case Focused
        case Excluded
    }
    
}

extension Internal {
    
    class ExampleGroup {
        
        var label: String
        var type: ExampleType
        var block: SleipnirBlock
        
        var parentGroup: ExampleGroup?
        var childGroups: ExampleGroup[] = ExampleGroup[]()
        
        var examples: Example[] = Example[]()
        
        var beforeEachBlocks: SleipnirBlock[] = SleipnirBlock[]()
        var afterEachBlocks: SleipnirBlock[] = SleipnirBlock[]()
        var beforeAllBlocks: SleipnirBlock[] = SleipnirBlock[]()
        var afterAllBlocks: SleipnirBlock[] = SleipnirBlock[]()
        
        init(_ label: String,
             _ block: SleipnirBlock,
             _ type: ExampleType = ExampleType.Normal)
        {
            self.label = label
            self.block = block
            self.type = type
        }
        
        func addChildGroup(group: ExampleGroup) {
            childGroups.append(group)
        }
        
        func addBeforeEach(block: SleipnirBlock) {
            beforeEachBlocks.append(block)
        }
        
        func addAfterEach(block: SleipnirBlock) {
            afterEachBlocks.append(block)
        }
        
        func addBeforeAll(block: SleipnirBlock) {
            beforeAllBlocks.append(block)
        }
        
        func addAfterAll(block: SleipnirBlock) {
            afterAllBlocks.append(block)
        }
        
        func addExample(example: Example) {
            examples.append(example)
        }
        
    }
    
}

extension Internal {
    
    class Example {
        
        var label: String
        var type: ExampleType
        var block: SleipnirBlock
        var group: ExampleGroup!
        
        init(_ label: String,
             _ block: SleipnirBlock,
             _ type: ExampleType = ExampleType.Normal)
        {
            self.label = label
            self.block = block
            self.type = type
        }
        
    }
    
}

// Dump

extension Internal {
    static func printWithPadding(string: String, level: Int) {
        var spaces = level * 2
        var padding = String(count: spaces, repeatedValue: Character(" "))
        println(padding + string)
    }
}

extension Internal.SpecTable {
    
    func dump() {
        for exampleGroup in topLevelGroups {
            exampleGroup.dump()
        }
    }
    
}

extension Internal.ExampleGroup {
    
    func dump(level: Int = 0) {
        Internal.printWithPadding("beforeAll: \(beforeAllBlocks.count)", level: level)
        Internal.printWithPadding("afterAll: \(afterAllBlocks.count)", level: level)
        
        Internal.printWithPadding("beforeEach: \(beforeEachBlocks.count)", level: level)
        Internal.printWithPadding("afterEach: \(afterEachBlocks.count)", level: level)
        
        Internal.printWithPadding("examples: \(examples.count)", level: level)
        
        for exampleGroup in childGroups {
            println()
            exampleGroup.dump(level: level + 1)
        }
    }
}
