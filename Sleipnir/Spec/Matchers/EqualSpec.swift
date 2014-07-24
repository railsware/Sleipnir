//
//  EqualSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/11/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class CustomObject : Equatable, Printable {
    
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    var description: String {
        return "CustomObject"
    }
    
}

func ==(left: CustomObject, right: CustomObject) -> Bool {
    return left.value == right.value
}

class EqualSpec : SleipnirSpec {
 
    var equalSpec : () = describe("Equal matcher") {
        
        describe("when the values are a built-in type") {
            let actualValue = 1
            var expectedValue: Int?
            
            describe("and the values are equal") {
                beforeEach {
                    expectedValue = 1
                }
                    
                describe("positive match") {
                    it("should pass") {
                        expect(actualValue).to(equal(expectedValue!))
                    }
                }
                    
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <1> to not equal <1>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).toNot(equal(expectedValue!))
                        }
                    }
                }
            }
                
            describe("and the values are not equal") {
                beforeEach {
                    expectedValue = 42
                }
                    
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <1> to equal <42>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).to(equal(expectedValue!))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(actualValue).toNot(equal(expectedValue!))
                    }
                }
            }
        }
        
        describe("when the values declared as an NSNumber") {
            let actualValue: NSNumber = 42
            var expectedValue: NSNumber?
            
            describe("and the values are equal") {
                beforeEach {
                    expectedValue = 42
                }
                    
                describe("positive match") {
                    it("should pass") {
                        expect(actualValue).to(equal(expectedValue!))
                    }
                }
                    
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <42> to not equal <42>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).toNot(equal(expectedValue!))
                        }
                    }
                }
            }
                
            describe("and the values are not equal") {
                beforeEach {
                    expectedValue = 7
                }
                    
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <42> to equal <7>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).to(equal(expectedValue!))
                        }
                    }
                }
                    
                describe("negative match") {
                    it("should pass") {
                        expect(actualValue).toNot(equal(expectedValue!))
                    }
                }
            }
        }
        
        describe("when the values are declared as an NSString") {
            let actualValue: NSString = "42"
            var expectedValue: NSString?
                
            describe("and the values are equal") {
                beforeEach {
                    expectedValue = "42"
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(actualValue).to(equal(expectedValue!))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <42> to not equal <42>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).toNot(equal(expectedValue!))
                        }
                    }
                }
            }
                
            describe("and the values are not equal") {
                beforeEach {
                    expectedValue = "7"
                }
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <42> to equal <7>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).to(equal(expectedValue!))
                        }
                    }
                }
                    
                describe("negative match") {
                    it("should pass") {
                        expect(actualValue).toNot(equal(expectedValue!))
                    }
                }
            }
        }

        describe("when the values are declared as an arrays") {
            let actualValue = [1, 2, 3]
            var expectedValue: [Int]?
            
            describe("and the values are equal") {
                beforeEach {
                    expectedValue = [1, 2, 3]
                }
                
                xdescribe("positive match") {
                    it("should pass") {
//                        expect(actualValue).to(equal(expectedValue!))
                    }
                }
                
                xdescribe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3)> to not equal <(1,2,3)>"
                        expectFailureWithMessage(failureMessage) {
//                            expect(actualValue).toNot(equal(expectedValue!))
                        }
                    }
                }
            }
            
            describe("and the values are not equal") {
                beforeEach {
                    expectedValue = [1, 2, 5]
                }
                
                xdescribe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3)> to equal <(1,2,5)>"
                        expectFailureWithMessage(failureMessage) {
//                            expect(actualValue).to(equal(expectedValue!))
                        }
                    }
                }
                
                xdescribe("negative match") {
                    it("should pass") {
//                        expect(actualValue).toNot(equal(expectedValue!))
                    }
                }
            }
        }
        
        describe("when the values are declared as a сustom object") {
            let actualValue = CustomObject(value: 42)
            var expectedValue: CustomObject?
            
            describe("and the values are equal") {
                beforeEach {
                    expectedValue = CustomObject(value: 42)
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(actualValue).to(equal(expectedValue!))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject> to not equal <CustomObject>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).toNot(equal(expectedValue!))
                        }
                    }
                }
            }
            
            describe("and the values are not equal") {
                beforeEach {
                    expectedValue = CustomObject(value: 7)
                }
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <CustomObject> to equal <CustomObject>"
                        expectFailureWithMessage(failureMessage) {
                            expect(actualValue).to(equal(expectedValue!))
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(actualValue).toNot(equal(expectedValue!))
                    }
                }
            }
        }

        describe("when the value is declared in a trailing closure") {
            let actualValue = 3
            var expectedValue: Int?
            
            describe("and the values are equal") {
                beforeEach {
                    expectedValue = 3
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect{ actualValue }.to(equal(expectedValue!))
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not equal <3>"
                        expectFailureWithMessage(failureMessage) {
                            expect{ actualValue }.toNot(equal(expectedValue!))
                        }
                    }
                }
            }
            
            context("and the value is an array") {
                let actualArrayValue = [1, 2, 3]
                var expectedArrayValue: [Int]?
                
                describe("and the expected array is equal") {
                    beforeEach {
                        expectedArrayValue = [1, 2, 3]
                    }
                    
                    xdescribe("positive match") {
                        it("should pass") {
//                            expect{ actualArrayValue }.to(equal(expectedArrayValue!))
                        }
                    }
                    
                    xdescribe("negative match") {
                        it("should fail with a sensible failure message") {
                            let failureMessage = "Expected <(1,2,3)> to not equal <(1,2,3)>"
                            expectFailureWithMessage(failureMessage) {
//                                expect{ actualArrayValue }.toNot(equal(expectedArrayValue!))
                            }
                        }
                    }
                }
            }
        }
        
    }
    
}