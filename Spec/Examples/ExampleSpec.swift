//
//  ExampleSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation
import Sleipnir

class ExampleSpec : SleipnirSpec {
    
    var exampleSpec : () = describe("Example") {
        
        var example: Example?
        let exampleText = "exampleText"
        let dispatcher = ReportDispatcher(with: Reporter[]())
        beforeEach {
            example = Example(exampleText, {})
        }
        
        describe("hasChildren") {
            it("should return false") {
                expect(example!.hasChildren()).to(beFalse())
            }
        }
        
        describe("state") {
            context("for a newly created example") {
                it("should be Incomplete") {
                    let exampleState = example!.state.get()
                    expect(exampleState).to(equal(ExampleState.Incomplete))
                }
            }
            
            context("for an example that has run and succeeded") {
                beforeEach {
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should be Passed") {
                    let exampleState = example!.state.get()
                    expect(exampleState).to(equal(ExampleState.Passed))
                }
            }

            context("for an example that has run and failed") {
                beforeEach {
                    example = Example("I should fail", { expect(false).to(beTrue()) })
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should be Failed") {
                    let exampleState = example!.state.get()
                    expect(exampleState).to(equal(ExampleState.Failed))
                }
            }
        }
        
        describe("fullText") {
            context("with no parent") {
                
                it("should return just its own text") {
                    expect(example!.fullText()).to(equal(exampleText))
                }
            }
            
            context("with a parent") {
             
                var group: ExampleGroup?
                let groupText = "Parent"
                beforeEach {
                    group = ExampleGroup(groupText, {})
                    group!.addExample(example!)
                    example!.group = group
                }
                
                it("should return its parent's text prepended with its own text") {
                    let expectedFullText = groupText + " " + exampleText
                    expect(example!.fullText()).to(equal(expectedFullText))
                }
                
                describe("when the parent also has a parent") {
                    
                    var rootGroup: ExampleGroup?
                    let rootGroupText = "Root"
                    beforeEach {
                        rootGroup = ExampleGroup(rootGroupText, {})
                        rootGroup!.addChildGroup(group!)
                    }
                    
                    it("should include the text from all parents, pre-pended in the appropriate order") {
                        let expectedFullText = rootGroupText + " " + groupText + " " + exampleText
                        expect(example!.fullText()).to(equal(expectedFullText))
                    }
                }
            }
        }
        
        describe("message") {
            describe("for an incomplete example") {
                it("should return an empty string") {
                    expect(example!.message()).to(equal(""))
                }
            }
            
            describe("for a passing example") {
                beforeEach {
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should return an empty string") {
                    expect(example!.message()).to(equal(""))
                }
            }
            
            describe("for a failing example") {
                let failureMessage = "Expected false to evaluate to true"
                
                beforeEach {
                    example = Example(failureMessage, { expect(false).to(beTrue()) })
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should return the failure message") {
                    expect(example!.message()).to(equal(failureMessage))
                }
            }
        }
        
    }
}