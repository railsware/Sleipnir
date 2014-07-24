//
//  ExampleGroup.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ExampleGroup : ExampleBase {
    
    var block: SleipnirBlock
    
    var childGroups: [ExampleGroup] = [ExampleGroup]()
    
    var examples: [Example] = [Example]()
    
    var beforeEachBlocks: [SleipnirBlock] = [SleipnirBlock]()
    var afterEachBlocks: [SleipnirBlock] = [SleipnirBlock]()
    var beforeAllBlocks: [SleipnirBlock] = [SleipnirBlock]()
    var afterAllBlocks: [SleipnirBlock] = [SleipnirBlock]()
    
    init(_ label: String, _ block: SleipnirBlock) {
        self.block = block
        super.init(label)
    }
    
    override func hasChildren() -> Bool {
        return examples.count >= 1
    }
    
    override func hasFocusedExamples() -> Bool {
        if self.focused {
            return true
        }
        
        for example in examples {
            if example.hasFocusedExamples() {
                return true
            }
        }
        
        for group in childGroups {
            if group.hasFocusedExamples() {
                return true
            }
        }
        
        return false
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
        parent?.runBeforeEach()
        for beforeEachBlock in beforeEachBlocks {
            beforeEachBlock()
        }
    }
    
    func runAfterEach() {
        for afterEachBlock in afterEachBlocks {
            afterEachBlock()
        }
        parent?.runAfterEach()
    }
    
    func fullText() -> String {
        if parent {
            return parent!.fullText() + " " + self.label
        } else {
            return self.label
        }
    }
    
    func addChildGroup(group: ExampleGroup) {
        childGroups.append(group)
        group.parent = self
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
        example.parent = self
    }
}

public func beforeAll(block: SleipnirBlock) {
    SpecTable.handleBeforeAll(block)
}

public func beforeEach(block: SleipnirBlock) {
    SpecTable.handleBeforeEach(block)
}

public func afterAll(block: SleipnirBlock) {
    SpecTable.handleAfterAll(block)
}

public func afterEach(block: SleipnirBlock) {
    SpecTable.handleAfterEach(block)
}

public func describe(label: String, block: SleipnirBlock) {
    var group = ExampleGroup(label, block)
    SpecTable.handleGroup(group)
}

public func fdescribe(label: String, block: SleipnirBlock) {
    var group = ExampleGroup(label, block)
    group.focused = true
    SpecTable.handleGroup(group)
}

public func xdescribe(label: String, block: SleipnirBlock) {
    var group = ExampleGroup(label, { it("is pending", PENDING) })
    SpecTable.handleGroup(group)
}

public func context(label: String, block: SleipnirBlock) {
    var group = ExampleGroup(label, block)
    SpecTable.handleGroup(group)
}

public func fcontext(label: String, block: SleipnirBlock) {
    var group = ExampleGroup(label, block)
    group.focused = true
    SpecTable.handleGroup(group)
}

public func xcontext(label: String, block: SleipnirBlock) {
    var group = ExampleGroup(label, { it("is pending", PENDING) })
    SpecTable.handleGroup(group)
}