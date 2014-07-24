//
//  SpecTable.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

struct SpecTable {
    
    static var topLevelGroups: [ExampleGroup] = [ExampleGroup]()
    static var currentGroup : ExampleGroup?
    
    static func handleGroup(group: ExampleGroup) {
        if (!currentGroup) {
            currentGroup = group
            topLevelGroups.append(currentGroup!)
            currentGroup?.block()
            currentGroup = nil
        } else {
            currentGroup?.addChildGroup(group)
            
            currentGroup = group
            currentGroup?.block()
            currentGroup = group.parent
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
        example.parent = currentGroup
        currentGroup?.addExample(example)
    }
}