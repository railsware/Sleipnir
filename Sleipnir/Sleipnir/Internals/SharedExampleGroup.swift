//
//  SharedExampleGroup.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/29/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public typealias SharedContext = () -> (NSDictionary)
public typealias SharedExampleBlock = (SharedContext) -> ()

struct SharedExampleGroup {
    
    static var sharedExampleGroups: [String : SharedExampleBlock] = [String : SharedExampleBlock]()
    
    static func handleSharedExampleGroup(label: String, block: SharedExampleBlock) {
        sharedExampleGroups[label] = block
    }
    
    static func invokeSharedExample(label: String, sharedContext: SharedContext) {
        if let block = sharedExampleGroups[label] {
            let group = ExampleGroup("")
            SpecTable.currentGroup?.addChildGroup(group)
            SpecTable.currentGroup = group
            block(sharedContext)
            SpecTable.currentGroup = group.parent
        }
    }
}

public func sharedExamplesFor(label: String, block: SleipnirBlock) {
    SharedExampleGroup.handleSharedExampleGroup(label, block: { (SharedExampleContext) in block() })
}

public func sharedExamplesFor(label: String, block: SharedExampleBlock) {
    SharedExampleGroup.handleSharedExampleGroup(label, block)
}

public func itShouldBehaveLike(label: String, sharedContext: SharedContext) {
    SharedExampleGroup.invokeSharedExample(label, sharedContext: sharedContext)
}

public func itShouldBehaveLike(label: String) {
    SharedExampleGroup.invokeSharedExample(label, sharedContext: { [:] })
}