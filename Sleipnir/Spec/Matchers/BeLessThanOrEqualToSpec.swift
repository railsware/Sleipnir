//
//  BeLessThanOrEqualToSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 8/4/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeLessThanOrEqualToSpec : SleipnirSpec {
    
    var beLessThanSpec : () = describe("BeLessThanOrEqualToSpec matcher") {
        
        context("Int") {
            var value: Int = 5
            
            describe("which is less than") {
                var expected = 10
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beLessThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be less than or equal to <10>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beLessThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not less than") {
                var expected = 1
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to be less than or equal to <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beLessThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beLessThanOrEqualTo(expected))
                    }
                }
            }
            
            describe("which is equal to") {
                var expected = 5
                
                it("should pass") {
                    expect(value).to(beLessThanOrEqualTo(expected))
                }
            }
        }
        
        context("Double") {
            var value: Double = 5.0
            
            describe("which is less than") {
                var expected = 10.0
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beLessThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5.0> to not be less than or equal to <10.0>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beLessThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not less than") {
                var expected = 1.0
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5.0> to be less than or equal to <1.0>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beLessThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beLessThanOrEqualTo(expected))
                    }
                }
            }
        }
        
        context("CustomObject") {
            var value: CustomObject = CustomObject(value: 5)
            
            describe("which is less than") {
                var expected = CustomObject(value: 10)
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beLessThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to not be less than or equal to <CustomObject(10)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beLessThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not less than") {
                var expected = CustomObject(value: 1)
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to be less than or equal to <CustomObject(1)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beLessThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beLessThanOrEqualTo(expected))
                    }
                }
            }
            
            describe("which is equal to") {
                var expected = CustomObject(value: 5)
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beLessThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject(5)> to not be less than or equal to <CustomObject(5)>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beLessThanOrEqualTo(expected))
                        }
                    }
                }
            }
        }
        
        context("NSNumber") {
            var value: NSNumber = NSNumber(integer: 5)
            
            describe("which is less than") {
                var expected = NSNumber(integer: 10)
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beLessThanOrEqualTo(expected))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to not be less than or equal to <10>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beLessThanOrEqualTo(expected))
                        }
                    }
                }
            }
            
            describe("which is not less than") {
                var expected = NSNumber(integer: 1)
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <5> to be less than or equal to <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beLessThanOrEqualTo(expected))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beLessThanOrEqualTo(expected))
                    }
                }
            }
            
        }
        
    }
    
    var operatorSpec : () = describe("<= operator matcher") {
        describe("when the actual value is less than expected value") {
            it("should pass") {
                expect(1) <= 3
            }
        }
        
        describe("when the actual value is not less than the expected value") {
            it("should fail with a sensible failure message") {
                let failureMessage = "Expected <9> to be less than or equal to <3>"
                expectFailureWithMessage(failureMessage) {
                    expect(9) <= 3
                }
            }
        }
        
        describe("when the actual value is equal to expected value") {
            it("should pass") {
                expect(3) <= 3
            }
        }
    }
    
}