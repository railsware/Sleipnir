//
//  SpecTable.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

struct SpecTable {
    
    static var topLevelGroups: ExampleGroup[] = ExampleGroup[]()
    static var currentGroup : ExampleGroup?
    
    static func handleGroup(group: ExampleGroup) {
        if (currentGroup == nil) {
            currentGroup = group
            addGroup(currentGroup!)
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
    
    /// Private
    
    static func addGroup(group: ExampleGroup) {
        topLevelGroups.append(group)
    }
}