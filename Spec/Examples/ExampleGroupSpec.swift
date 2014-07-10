//
//  ExampleGroupSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation
import Sleipnir

class ExampleGroupSpec : SleipnirSpec {
    
    var exampleGroupSpec : () = describe("ExampleGroup") {
        
        var group: ExampleGroup?
        var passedExample: Example?
        var failedExample: Example?
        let dispatcher = ReportDispatcher(with: Reporter[]())
        beforeEach {
            group = ExampleGroup("Group!", {})
            passedExample = Example("I should pass", {})
            failedExample = Example("I should fail", {})
            failedExample!.setState(ExampleState.Failed)
        }
        
        describe("hasChildren") {
            describe("for an empty group") {
                it("should be empty") {
                    expect(group!.examples.count).to(equal(0))
                    expect(group!.hasChildren()).to(beFalse())
                }
                
            }
            
            describe("for a non-empty group") {
                beforeEach {
                    group!.addExample(passedExample!)
                }
                
                it("should not be empty") {
                    expect(group!.examples.count).to(equal(1))
                    expect(group!.hasChildren()).to(beTrue())
                }
            }
        }
        
        describe("afterEach") {
            var blockInvocationCount: Int = 0
            beforeEach {
                blockInvocationCount = 0
                let afterEachBlock = { () -> () in blockInvocationCount = blockInvocationCount + 1 }
                group!.addAfterEach(afterEachBlock)
                group!.addExample(passedExample!)
                group!.addExample(failedExample!)
                passedExample!.group = group
                failedExample!.group = group
                group!.runWithDispatcher(dispatcher)
            }
            
            it("should be called after each example run") {
                expect(blockInvocationCount).to(equal(2))
            }
        }
    }
}