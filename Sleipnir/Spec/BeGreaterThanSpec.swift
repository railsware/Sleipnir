//
//  BeGreaterThanSpec.swift
//  Sleipnir
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeGreaterThanSpec : SleipnirSpec {
    
    var beGreaterThanSpec : () = describe("BeGreaterThan matcher") {
        
        context("Int") {
            var value: Int = 5
            
            describe("which is greater than") {
                var expected = 1
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beGreaterThan(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be greater than <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThan(expected))
                        }
                    }
                }
                
            }
            
            describe("which is not greater than") {
                var expected = 10
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to be greater than <10>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beGreaterThan(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beGreaterThan(expected))
                    }
                }
                
            }
            
        }
        
    }
    
}
