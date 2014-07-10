//
//  ExampleGroup.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ExampleGroup : ExampleBase {
    
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
        _ type: ExampleType = ExampleType.Normal) {
        self.block = block
        self.type = type
        super.init(label)
    }
    
    override func hasChildren() -> Bool {
        return examples.count >= 1
    }
    
    override func runWithDispatcher(dispatcher: ReportDispatcher) {
        dispatcher.runWillStartExampleGroup(self)
        
        for beforeAll in beforeAllBlocks {
            beforeAll()
        }
        
        for example in examples {
            example.runWithDispatcher(dispatcher)
        }
        
        for childGroup in childGroups {
            childGroup.runWithDispatcher(dispatcher)
        }
        
        for afterAll in afterAllBlocks {
            afterAll()
        }

        dispatcher.runDidFinishExampleGroup(self)
    }
    
    func runBeforeEach() {
        parentGroup?.runBeforeEach()
        for beforeEachBlock in beforeEachBlocks {
            beforeEachBlock()
        }
    }
    
    func runAfterEach() {
        for afterEachBlock in afterEachBlocks {
            afterEachBlock()
        }
        parentGroup?.runAfterEach()
    }
    
    func fullText() -> String {
        if parentGroup {
            return parentGroup!.fullText() + " " + self.label
        } else {
            return self.label
        }
    }
    
    func addChildGroup(group: ExampleGroup) {
        childGroups.append(group)
        group.parentGroup = self
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

func beforeAll(block: () -> ()) {
    SpecTable.handleBeforeAll(block)
}

func beforeEach(block: () -> ()) {
    SpecTable.handleBeforeEach(block)
}

func afterAll(block: () -> ()) {
    SpecTable.handleAfterAll(block)
}

func afterEach(block: () -> ()) {
    SpecTable.handleAfterEach(block)
}

func describe(label: String, block: () -> ()) {
    var group = ExampleGroup(label, block)
    SpecTable.handleGroup(group)
}

func fdescribe(label: String, block: () -> ()) {
    var group = ExampleGroup(label, block, ExampleType.Focused)
    SpecTable.handleGroup(group)
}

func xdescribe(label: String, block: () -> ()) {
    var group = ExampleGroup(label, block, ExampleType.Excluded)
    SpecTable.handleGroup(group)
}

func context(label: String, block: () -> ()) {
    var group = ExampleGroup(label, block)
    SpecTable.handleGroup(group)
}