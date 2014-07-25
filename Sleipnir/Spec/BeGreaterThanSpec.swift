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

        context("Double") {
            var value: Double = 5.0
            
            describe("which is greater than") {
                var expected = 1.0
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beGreaterThan(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5.0> to not be greater than <1.0>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThan(expected))
                        }
                    }
                }
                
            }
            
            describe("which is not greater than") {
                var expected = 10.0
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5.0> to be greater than <10.0>"
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
        
        context("CustomObject") {
            var value: CustomObject = CustomObject(value: 5)
            
            describe("which is greater than") {
                var expected = CustomObject(value: 1)
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beGreaterThan(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to not be greater than <CustomObject(1)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThan(expected))
                        }
                    }
                }
                
            }
            
            describe("which is not greater than") {
                var expected = CustomObject(value: 10)
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to be greater than <CustomObject(10)>"
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
        
        context("NSNumber") {
            var value: NSNumber = NSNumber(integer: 5)
            
            describe("which is greater than") {
                var expected = NSNumber(integer: 1)
                
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
                var expected = NSNumber(integer: 10)
                
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
