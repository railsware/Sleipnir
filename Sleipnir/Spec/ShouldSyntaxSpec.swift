//
//  ShouldSyntaxSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation
import Sleipnir

class ShouldSyntaxSpec : SleipnirSpec {
    
    var shouldSyntaxSpec : () = describe("Should syntax") {
        
        context("should") {
            
            describe("when the values are declared as Ints") {
                it("should work with positive case") {
                    let value = 3
                    value.should(equal(3))
                }
                
                it("should work with negative case") {
                    let failureMessage = "Expected <3> to equal <4>"
                    expectFailureWithMessage(failureMessage) {
                        3.should(equal(4))
                    }
                }
            }
            
            describe("when the values are declared as Strings") {
                it("should work with positive case") {
                    let value = "3"
                    value.should(equal("3"))
                }
                
                it("should work with negative case") {
                    let failureMessage = "Expected <3> to equal <4>"
                    expectFailureWithMessage(failureMessage) {
                        "3".should(equal("4"))
                    }
                }
            }
            
            describe("when the values are declared as Doubles") {
                it("should work with positive case") {
                    let value : Double = 3.03
                    value.should(equal(3.03))
                }
                
                it("should work with negative case") {
                    let failureMessage = "Expected <3.03> to equal <4.03>"
                    expectFailureWithMessage(failureMessage) {
                        3.03.should(equal(4.03))
                    }
                }
            }
            
            describe("when the values are declared as Floats") {
                it("should work with positive case") {
                    let value : Float = 3.03
                    value.should(equal(3.03))
                }
            }
            
            describe("when the values are declared as Bools") {
                it("should work with positive case") {
                    let value = true
                    value.should(beTrue())
                }
                
                it("should work with negative case") {
                    let failureMessage = "Expected <true> to evaluate to false"
                    expectFailureWithMessage(failureMessage) {
                        true.should(beFalse())
                    }
                }
            }
            
            describe("when the values are declared as Arrays") {
                it("should work with positive case") {
                    let value = [1, 2, 3]
//                    value.should(equal([1, 2, 3]))
                }
                
                it("should work with negative case") {
                    let failureMessage = "Expected <[1, 2, 3]> to equal <[1, 2, 4]>"
//                    expectFailureWithMessage(failureMessage) {
//                        [1, 2, 3].should(equal([1, 2, 4]))
//                    }
                }
            }

        }
        
        context("should_not") {
            
            it("should work with positive case") {
                3.shouldNot(equal(4))
            }
            
            it("should work with negative case") {
                let failureMessage = "Expected <3> to not equal <3>"
                expectFailureWithMessage(failureMessage) {
                    3.shouldNot(equal(3))
                }
            }
        }
    }
    
}