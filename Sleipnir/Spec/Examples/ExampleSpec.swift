//
//  ExampleSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func runInFocusedSpecsMode(example: ExampleBase, dispatcher: ReportDispatcher) {
    let before = Runner.shouldOnlyRunFocused
    Runner.shouldOnlyRunFocused = true
    example.runWithDispatcher(dispatcher)
    Runner.shouldOnlyRunFocused = before
}

class ExampleSpec : SleipnirSpec {
    
    var exampleSpec : () = describe("Example") {
        
        var example: Example?
        let exampleText = "exampleText"
        let dispatcher = ReportDispatcher(with: [Reporter]())
        beforeEach {
            example = Example(exampleText, {})
        }
        
        describe("hasChildren") {
            it("should return false") {
                expect(example!.hasChildren()).to(beFalse())
            }
        }
        
        describe("focused") {
            it("should return false by default") {
                expect(example!.focused).to(beFalse())
            }
        }
        
        describe("hasFocusedExamples") {
            it("should return false by default") {
                expect(example!.hasFocusedExamples()).to(beFalse())
            }
            
            it("should return false when example is not focused") {
                example!.focused = false
                expect(example!.hasFocusedExamples()).to(beFalse())
            }
            
            it("should return true when example is focused") {
                example!.focused = true
                expect(example!.hasFocusedExamples()).to(beTrue())
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
            
            context("for a pending example") {
                beforeEach {
                    example = Example("I should be pending", PENDING)
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should be Pending") {
                    let exampleState = example!.state.get()
                    expect(exampleState).to(equal(ExampleState.Pending))
                }
            }
            
            context("when running in the focused specs mode") {
                context("for an example that was focused") {
                    beforeEach {
                        example!.focused = true
                        runInFocusedSpecsMode(example!, dispatcher)
                    }
                    
                    it("should be Passed") {
                        let exampleState = example!.state.get()
                        expect(exampleState).to(equal(ExampleState.Passed))
                    }
                }
                
                context("for an example that was not focused") {
                    beforeEach {
                        example!.focused = false
                    }
                    
                    context("and its parent group was focused") {
                        beforeEach {
                            let parentGroup = ExampleGroup("ParentGroup", {})
                            parentGroup.focused = true
                            example!.parent = parentGroup
                            
                            runInFocusedSpecsMode(example!, dispatcher)
                        }
                        
                        it("should be Passed") {
                            let exampleState = example!.state.get()
                            expect(exampleState).to(equal(ExampleState.Passed))
                        }
                    }
                    
                    context("and its parent group was not focused") {
                        
                        var parentGroup: ExampleGroup?
                        beforeEach {
                            parentGroup = ExampleGroup("ParentGroup", {})
                            parentGroup!.focused = false
                            example!.parent = parentGroup
                            
                            runInFocusedSpecsMode(example!, dispatcher)
                        }
                        
                        it("should be Skipped") {
                            let exampleState = example!.state.get()
                            expect(exampleState).to(equal(ExampleState.Skipped))
                        }
                        
                        context("and its parent's parent group was focused") {
                            beforeEach {
                                let parentsParentGroup = ExampleGroup("Parent's parent group", {})
                                parentsParentGroup.focused = true
                                parentGroup!.parent = parentsParentGroup
                                
                                runInFocusedSpecsMode(example!, dispatcher)
                            }
                            
                            it("should be Passed") {
                                let exampleState = example!.state.get()
                                expect(exampleState).to(equal(ExampleState.Passed))
                            }
                        }
                    }
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
            
            describe("for a skipped example") {
                beforeEach {
                    example!.focused = false
                    runInFocusedSpecsMode(example!, dispatcher)
                }
                
                it("should return an empty string") {
                    expect(example!.message()).to(equal(""))
                }
            }
            
            describe("for a pending example") {
                beforeEach {
                    example = Example("I should be pending", PENDING)
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should return an empty string") {
                    expect(example!.message()).to(equal(""))
                }
            }
            
            describe("for a failing example") {
                let failureMessage = "Expected <false> to evaluate to true"
                
                beforeEach {
                    example = Example(failureMessage, { expect(false).to(beTrue()) })
                    example!.runWithDispatcher(dispatcher)
                }
                
                it("should return the failure message") {
                    expect(example!.message()).to(equal(failureMessage))
                }
            }
        }
        
        describe("isPending") {
            context("for an example with a block") {
                it("should not report itself as pending") {
                    expect(example!.isPending()).to(beFalse())
                }
                
                context("after it has run") {
                    beforeEach {
                        example!.runWithDispatcher(dispatcher)
                    }
                    
                    it("should not report itself as pending") {
                        expect(example!.isPending()).to(beFalse())
                    }
                }
            }
            
            context("for a pending example") {
                beforeEach {
                    example = Example("I should be pending", PENDING)
                }
                
                it("should report itself as pending") {
                    expect(example!.isPending()).to(beTrue())
                }
                
                context("after it has run") {
                    beforeEach {
                        example!.runWithDispatcher(dispatcher)
                    }
                    
                    it("should report itself as pending") {
                        expect(example!.isPending()).to(beTrue())
                    }
                }
            }
        }
        
    }
}