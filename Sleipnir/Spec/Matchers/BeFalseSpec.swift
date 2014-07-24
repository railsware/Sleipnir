//
//  BeFalseSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/11/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeFalseSpec : SleipnirSpec {
    
    var beFalseSpec : () = describe("BeFalse matcher") {
        
        context("value") {
            var value: Bool?
            
            describe("which evaluates to false") {
                beforeEach {
                    value = false
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(value!).to(beFalse())
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <false> to not evaluate to false"
                        expectFailureWithMessage(failureMessage) {
                            expect(value!).toNot(beFalse())
                        }
                    }
                }
            }
            
            describe("which evaluates to true") {
                beforeEach {
                    value = true
                }

                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <true> to evaluate to false"
                        expectFailureWithMessage(failureMessage) {
                            expect(value!).to(beFalse())
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value!).toNot(beFalse())
                    }
                }
            }
        }

    }
    
}