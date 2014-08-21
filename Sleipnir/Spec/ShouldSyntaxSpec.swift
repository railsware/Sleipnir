//
//  ShouldSyntaxSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ShouldSyntaxSpec : SleipnirSpec {
    
    var shouldSyntaxSpec : () = describe("Should syntax") {
        
        describe("when the values are declared as Booleans") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = true
                        let expected = true
                        actual.should.equal(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <true> to not equal <true>"
                        expectFailureWithMessage(failureMessage) {
                            true.shouldNot.equal(true)
                        }
                    }
                }
            }
            
            describe("BeTrue matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = true
                        actual.should.beTrue()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <true> to not evaluate to true"
                        expectFailureWithMessage(failureMessage) {
                            true.shouldNot.beTrue()
                        }
                    }
                }
            }
            
            describe("BeFalse matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = false
                        actual.should.beFalse()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <false> to not evaluate to false"
                        expectFailureWithMessage(failureMessage) {
                            false.shouldNot.beFalse()
                        }
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Bool? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: Bool? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
        }
        
        describe("when the values are declared as Ints") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = 3
                        let expected = 3
                        actual.should.equal(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not equal <3>"
                        expectFailureWithMessage(failureMessage) {
                            3.shouldNot.equal(3)
                        }
                    }
                }
            }
            
            describe("BeGreaterThan matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = 4
                        let expected = 3
                        actual.should.beGreaterThan(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <4> to not be greater than <3>"
                        expectFailureWithMessage(failureMessage) {
                            4.shouldNot.beGreaterThan(3)
                        }
                    }
                }
            }
            
            describe("BeLessThan matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = 3
                        let expected = 4
                        actual.should.beLessThan(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not be less than <4>"
                        expectFailureWithMessage(failureMessage) {
                            3.shouldNot.beLessThan(4)
                        }
                    }
                }
            }
            
            describe("BeGreaterThanOrEqualTo matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = 3
                        let expected = 3
                        actual.should.beGreaterThanOrEqualTo(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not be greater than or equal to <3>"
                        expectFailureWithMessage(failureMessage) {
                            3.shouldNot.beGreaterThanOrEqualTo(3)
                        }
                    }
                }
            }
            
            describe("BeLessThanOrEqualTo matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = 3
                        let expected = 3
                        actual.should.beLessThanOrEqualTo(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not be less than or equal to <3>"
                        expectFailureWithMessage(failureMessage) {
                            3.shouldNot.beLessThanOrEqualTo(3)
                        }
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Int? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: Int? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
        }
        
        describe("when the values are declared as Doubles") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Double = 3.33
                        let expected: Double = 3.33
                        actual.should.equal(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3.33> to not equal <3.33>"
                        expectFailureWithMessage(failureMessage) {
                            3.33.shouldNot.equal(3.33)
                        }
                    }
                }
            }
            
            describe("BeGreaterThan matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Double = 4.33
                        let expected: Double = 3.33
                        actual.should.beGreaterThan(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <4.33> to not be greater than <3.33>"
                        expectFailureWithMessage(failureMessage) {
                            4.33.shouldNot.beGreaterThan(3.33)
                        }
                    }
                }
            }
            
            describe("BeLessThan matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Double = 3.33
                        let expected: Double = 4.33
                        actual.should.beLessThan(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3.33> to not be less than <4.33>"
                        expectFailureWithMessage(failureMessage) {
                            3.33.shouldNot.beLessThan(4.33)
                        }
                    }
                }
            }
            
            describe("BeGreaterThanOrEqualTo matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Double = 3.33
                        let expected: Double = 3.33
                        actual.should.beGreaterThanOrEqualTo(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3.33> to not be greater than or equal to <3.33>"
                        expectFailureWithMessage(failureMessage) {
                            3.33.shouldNot.beGreaterThanOrEqualTo(3.33)
                        }
                    }
                }
            }
            
            describe("BeLessThanOrEqualTo matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Double = 3.33
                        let expected: Double = 3.33
                        actual.should.beLessThanOrEqualTo(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3.33> to not be less than or equal to <3.33>"
                        expectFailureWithMessage(failureMessage) {
                            3.33.shouldNot.beLessThanOrEqualTo(3.33)
                        }
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Double? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: Double? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
        }
        
        describe("when the values are declared as Floats") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Float = 3.33
                        let expected: Float = 3.33
                        actual.should.equal(expected)
                    }
                }
            }
            
            describe("BeGreaterThan matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Float = 4.33
                        let expected: Float = 3.33
                        actual.should.beGreaterThan(expected)
                    }
                }
            }
            
            describe("BeLessThan matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Float = 3.33
                        let expected: Float = 4.33
                        actual.should.beLessThan(expected)
                    }
                }
            }
            
            describe("BeGreaterThanOrEqualTo matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Float = 3.33
                        let expected: Float = 3.33
                        actual.should.beGreaterThanOrEqualTo(expected)
                    }
                }
             }
            
            describe("BeLessThanOrEqualTo matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Float = 3.33
                        let expected: Float = 3.33
                        actual.should.beLessThanOrEqualTo(expected)
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Float? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: Float? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
        }

        describe("when the values are declared as Strings") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : String = "3"
                        let expected : String = "3"
                        actual.should.equal(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not equal <3>"
                        expectFailureWithMessage(failureMessage) {
                            "3".shouldNot.equal("3")
                        }
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: String? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: String? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
            
            describe("Contain matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = "Test String"
                        let expected = "String"
                        actual.should.contain(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <Test String> to not contain <String>"
                        expectFailureWithMessage(failureMessage) {
                            "Test String".shouldNot.contain("String")
                        }
                    }
                }
            }

            describe("BeginWith matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = "Test String"
                        actual.should.beginWith("Tes")
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <Test String> to not begin with <Tes>"
                        expectFailureWithMessage(failureMessage) {
                            "Test String".shouldNot.beginWith("Tes")
                        }
                    }
                }
            }

            describe("EndWith matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = "Test String"
                        let expected = "String"
                        actual.should.endWith(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <Test String> to not end with <String>"
                        expectFailureWithMessage(failureMessage) {
                            "Test String".shouldNot.endWith("String")
                        }
                    }
                }
            }

            describe("BeEmpty matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = ""
                        actual.should.beEmpty()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            "".shouldNot.beEmpty()
                        }
                    }
                }
            }
        }
        
        describe("when the values are declared as Arrays") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = [1,2,3]
                        let expected = [1,2,3]
                        actual.should.equal(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3]> to not equal <[1, 2, 3]>"
                        expectFailureWithMessage(failureMessage) {
                            [1,2,3].shouldNot.equal([1,2,3])
                        }
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Array<AnyObject>? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: Array<AnyObject>? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
            
            describe("Contain matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = [1,2,3]
                        let nested = 1
                        actual.should.contain(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3)> to not contain <1>"
                        expectFailureWithMessage(failureMessage) {
                            [1,2,3].shouldNot.contain(1)
                        }
                    }
                }
            }

            describe("BeginWith matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = [1,2,3]
                        let nested = 1
                        actual.should.beginWith(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3)> to not begin with <1>"
                        expectFailureWithMessage(failureMessage) {
                            [1,2,3].shouldNot.beginWith(1)
                        }
                    }
                }
            }
            
            describe("EndWith matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual = [1,2,3]
                        let nested = 3
                        actual.should.endWith(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3)> to not end with <3>"
                        expectFailureWithMessage(failureMessage) {
                            [1,2,3].shouldNot.endWith(3)
                        }
                    }
                }
            }
            
            describe("BeEmpty matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: Array<Int> = []
                        actual.should.beEmpty()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[]> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            let actual: Array<Int> = []
                            actual.shouldNot.beEmpty()
                        }
                    }
                }
            }
        }
        
        describe("when the value is declared as NSSet") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSSet = NSSet(array: [1,2,3])
                        let expected : NSSet = NSSet(array: [1,2,3])
                        actual.should.equal(expected)
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: NSSet? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: NSSet? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
            
            describe("Contain matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSSet = NSSet(array: [1,2,3])
                        let nested = 1
                        actual.should.contain(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let actual : NSSet = NSSet(array: [1,2,3])
                        let failureMessage = "Expected <{(3,1,2)}> to not contain <1>"
                        
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.contain(1)
                        }
                    }
                }
            }
            
            describe("BeEmpty matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSSet = NSSet(array: [])
                        actual.should.beEmpty()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <{()}> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            let actual : NSSet = NSSet(array: [])
                            actual.shouldNot.beEmpty()
                        }
                    }
                }
            }
        }
        
        describe("when the value is declared as NSArray") {
            describe("Equal matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let expected : NSArray = NSArray(array: [1,2,3])
                        actual.should.equal(expected)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let failureMessage = "Expected <(1,2,3)> to not equal <(1,2,3)>"
                        
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.equal([1,2,3])
                        }
                    }
                }
            }
            
            describe("BeNil matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual: NSArray? = nil
                        actual.should.beNil()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        let actual: NSArray? = nil
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beNil()
                        }
                    }
                }
            }
            
            describe("Contain matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let nested = 1
                        actual.should.contain(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let failureMessage = "Expected <(1,2,3)> to not contain <1>"
                        
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.contain(1)
                        }
                    }
                }
            }
            
            describe("BeginWith matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let nested = 1
                        actual.should.beginWith(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let failureMessage = "Expected <(1,2,3)> to not begin with <1>"
                        
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.beginWith(1)
                        }
                    }
                }
            }
            
            describe("EndWith matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let nested = 3
                        actual.should.endWith(nested)
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let actual : NSArray = NSArray(array: [1,2,3])
                        let failureMessage = "Expected <(1,2,3)> to not end with <3>"
                        
                        expectFailureWithMessage(failureMessage) {
                            actual.shouldNot.endWith(3)
                        }
                    }
                }
            }
            
            describe("BeEmpty matcher") {
                context("positive match") {
                    it("should pass") {
                        let actual : NSArray = NSArray(array: [])
                        actual.should.beEmpty()
                    }
                }
                
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <()> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            let actual : NSArray = NSArray(array: [])
                            actual.shouldNot.beEmpty()
                        }
                    }
                }
            }
        }

    }
    
}