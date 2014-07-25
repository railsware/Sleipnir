//
//  BeginWithSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeginWithSpec : SleipnirSpec {
    
    var beginWithSpec : () = describe("BeginWith matcher") {
        
        describe("when the container is an Array") {
            var container: [Int]?
            
            context("and it is is nil") {
                beforeEach {
                    container = nil
                }
                
                it("should fail") {
                    let failureMessage = "Expected <nil> to begin with <[1]>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(beginWith(1))
                    }
                }
            }
            
            context("and it is empty") {
                beforeEach {
                    container = [Int]()
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <[]> to begin with <[1]>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(beginWith(1))
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
                        expect(container).to(beginWith(element))
                    }
                }
                
                describe("negative match") {
                    let element = 1
                        
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3, 4, 5]> to not begin with <[1]>"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(beginWith(element))
                        }
                    }
                }
            }
        }
        
        describe("when the container is a String") {
            let container = "Test String"
            var nested: String?
            
            context("and it begins with nested String") {
                beforeEach {
                    nested = "Test"
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(container).to(beginWith(nested!))
                    }
                }
            }
            
            context("and it does not begin with nested String") {
                beforeEach {
                    nested = "Testt"
                }
                
                it("should fail with a sensible failure message") {
                    let failureMessage = "Expected <Test String> to begin with <Testt>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(beginWith(nested!))
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
                    let failureMessage = "Expected <()> to begin with <1>"
                    expectFailureWithMessage(failureMessage) {
                        expect(container).to(beginWith(1))
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
                        expect(container).to(beginWith(element))
                    }
                }
                
                describe("negative match") {
                    let element = 1
                    
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3,4,5)> to not begin with <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(beginWith(element))
                        }
                    }
                }
            }
        }

    }
    
}