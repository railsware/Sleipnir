//
//  EndWithSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class EndWithSpec : SleipnirSpec {
    
    var endWithSpec : () = describe("EndWith matcher") {
        
        describe("when the container is an Array") {
            var container: [Int]?
            
            context("and it is is nil") {
                beforeEach {
                    container = nil
                }
                
                it("should fail") {
                    let failureMessage = "Expected <nil> to end with <[1]>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(endWith(1))
                    }
                }
            }
            
            context("and it is empty") {
                beforeEach {
                    container = [Int]()
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <[]> to end with <[1]>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(endWith(1))
                    }
                }
            }
            
            context("and it contains elements") {
                beforeEach {
                    container = [1, 2, 3, 4, 5]
                }
                
                describe("positive match") {
                    let element = 5
                    
                    it("should pass") {
                        expect(container).to(endWith(element))
                    }
                }
                
                describe("negative match") {
                    let element = 5
                    
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3, 4, 5]> to not end with <[5]>"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(endWith(element))
                        }
                    }
                }
            }
        }
        
        describe("when the container is a String") {
            let container = "Test String"
            var nested: String?
            
            context("and it ends with nested String") {
                beforeEach {
                    nested = "String"
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(container).to(endWith(nested!))
                    }
                }
            }
            
            context("and it does not end with nested String") {
                beforeEach {
                    nested = "Testt"
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <Test String> to end with <Testt>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(endWith(nested!))
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
                    let failureMessage = "Expected <()> to end with <1>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(endWith(1))
                    }
                }
            }
            
            context("and it contains elements") {
                beforeEach {
                    container = NSArray(array: [1, 2, 3, 4, 5])
                }
                
                describe("positive match") {
                    let element = 5
                    
                    it("should pass") {
                        expect(container).to(endWith(element))
                    }
                }
                
                describe("negative match") {
                    let element = 5
                    
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3,4,5)> to not end with <5>"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(endWith(element))
                        }
                    }
                }
            }
        }
        
    }
    
}