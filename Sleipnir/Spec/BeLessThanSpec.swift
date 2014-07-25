//
//  BeLessThanSpec.swift
//  Sleipnir
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeLessThanSpec : SleipnirSpec {
    
    var beLessThanSpec : () = describe("BeLessThan matcher") {
        
        context("Int") {
            var value: Int = 5
            
            describe("which is less than") {
                var expected = 10
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beLessThan(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be less than <10>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beLessThan(expected))
                        }
                    }
                }
                
            }
            
            describe("which is not less than") {
                var expected = 1
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to be less than <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beLessThan(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beLessThan(expected))
                    }
                }
                
            }
            
        }
        
    }
    
}
