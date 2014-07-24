//
//  BeTrueSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/11/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeTrueSpec : SleipnirSpec {
    
    var beTrueSpec : () = describe("BeTrue matcher") {
        
        context("value") {
            var value: Bool?
            
            describe("which evaluates to true") {
                beforeEach {
                    value = true
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(value!).to(beTrue())
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <true> to not evaluate to true"
                        expectFailureWithMessage(failureMessage) {
                            expect(value!).toNot(beTrue())
                        }
                    }
                }
            }
            
            describe("which evaluates to false") {
                beforeEach {
                    value = false
                }
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <false> to evaluate to true"
                        expectFailureWithMessage(failureMessage) {
                            expect(value!).to(beTrue())
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value!).toNot(beTrue())
                    }
                }
            }
        }
        
    }
    
}