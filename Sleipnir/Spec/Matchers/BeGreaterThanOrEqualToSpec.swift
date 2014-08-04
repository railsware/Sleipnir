//
//  BeGreaterThanOrEqualSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 8/4/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeGreaterThanOrEqualSpec : SleipnirSpec {
    
    var beGreaterThanOrEqualSpec : () = describe("BeGreaterThanOrEqualTo matcher") {
        
        context("Int") {
            var value: Int = 5
            
            describe("which is greater than") {
                var expected = 1
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beGreaterThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be greater than or equal to <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not greater than") {
                var expected = 10
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to be greater than or equal to <10>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beGreaterThanOrEqualTo(expected))
                    }
                }
            }
            
            describe("which is equal to") {
                var expected = 5
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beGreaterThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be greater than or equal to <5>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThanOrEqualTo(expected))
                        }
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
                        expect(value).to(beGreaterThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5.0> to not be greater than or equal to <1.0>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not greater than") {
                var expected = 10.0
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5.0> to be greater than or equal to <10.0>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beGreaterThanOrEqualTo(expected))
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
                        expect(value).to(beGreaterThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to not be greater than or equal to <CustomObject(1)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not greater than") {
                var expected = CustomObject(value: 10)
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to be greater than or equal to <CustomObject(10)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beGreaterThanOrEqualTo(expected))
                    }
                }
            }
            
            describe("which is equal to") {
                var expected = CustomObject(value: 5)
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beGreaterThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to not be greater than or equal to <CustomObject(5)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThanOrEqualTo(expected))
                        }
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
                        expect(value).to(beGreaterThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be greater than or equal to <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not greater than") {
                var expected = NSNumber(integer: 10)
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to be greater than or equal to <10>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beGreaterThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beGreaterThanOrEqualTo(expected))
                    }
                }
            }
        }
    }
    
    var operatorSpec : () = describe(">= operator matcher") {
        describe("when the actual value is greater than expected value") {
            it("should pass") {
                expect(9) >= 3
            }
        }
        
        describe("when the actual value is not greater than the expected value") {
            it("should fail with a sensible failure message") {
                let failureMessage = "Expected <1> to be greater than or equal to <3>"
                expectFailureWithMessage(failureMessage) {
                    expect(1) >= 3
                }
            }
        }
        
        describe("when the actual value is equal to expected value") {
            it("should pass") {
                expect(3) >= 3
            }
        }
    }
    
}