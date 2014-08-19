//
//  ContainSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/22/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ContainSpec : SleipnirSpec {
    
    var containSpec : () = describe("Contain matcher") {
        
        describe("when the container is an Array") {
            var container: [Int]?
            
            context("and it is is nil") {
                beforeEach {
                    container = nil
                }
                
                it("should fail") {
                    let failureMessage = "Expected <nil> to contain <1>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(contain(1))
                    }
                }
            }
            
            context("and it is empty") {
                beforeEach {
                    container = [Int]()
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <[]> to contain <1>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(contain(1))
                    }
                }
            }
            
            context("and it contains elements") {
                beforeEach {
                    container = [1, 2, 3, 4, 5]
                }
                
                describe("positive match") {
                    let element = 1
                        
                    it("should pass") {
                        expect(container).to(contain(element))
                    }
                }
                
                describe("negative match") {
                    let element = 1
                    
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3, 4, 5]> to not contain <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(contain(element))
                        }
                    }
                }
            }
        }
        
        describe("when the container is a String") {
            let container = "Test String"
            var nested: String?
            
            context("and it contains nested String") {
                beforeEach {
                    nested = "Test"
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(container).to(contain(nested!))
                    }
                }
            }
            
            context("and it does not contain nested String") {
                beforeEach {
                    nested = "Testt"
                }

                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <Test String> to contain <Testt>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(contain(nested!))
                    }
                }
            }
        }
        
        describe("when the container is an NSArray") {
            var container: NSArray?
            
            context("and it is empty") {
                beforeEach {
                    container = NSArray(array: [])
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <()> to contain <1>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(contain(1))
                    }
                }
            }
            
            context("and it contains elements") {
                beforeEach {
                    container = NSArray(array: [1, 2, 3, 4, 5])
                }
                
                describe("positive match") {
                    let element = 1
                        
                    it("should pass") {
                        expect(container).to(contain(element))
                    }
                }
                
                context("when elements are Strings") {
                    beforeEach {
                        container = NSArray(array: ["test", "string"])
                    }
                    
                    describe("positive match") {
                        let element = "test"
                        
                        it("should pass") {
                            expect(container).to(contain(element))
                        }
                    }
                }
            }
        }
        
        describe("when the container is an NSSet") {
            var container: NSSet?
            
            context("and it is empty") {
                beforeEach {
                    container = NSSet(array: [])
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <{()}> to contain <1>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(contain(1))
                    }
                }
            }
            
            context("and it contains elements") {
                beforeEach {
                    container = NSSet(array: [1, 2, 3, 4, 5])
                }
                
                describe("positive match") {
                    let element = 1
                        
                    it("should pass") {
                        expect(container).to(contain(element))
                    }
                }
            }
        }
        
    }
    
}