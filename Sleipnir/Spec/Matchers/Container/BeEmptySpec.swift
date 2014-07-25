//
//  BeEmptySpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/23/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeEmptySpec : SleipnirSpec {
    
    var beEmptySpec : () = describe("BeEmpty matcher") {
     
        describe("when the value is nil") {
            var container: [Int]? = nil
            
            describe("positive match") {
                it("should pass") {
                    expect(container).to(beEmpty())
                }
            }
        }
        
        describe("when the value is an Array") {
            context("which is empty") {
                let container = [Int]()
                
                describe("positive match") {
                    it("should pass") {
                        expect(container).to(beEmpty())
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[]> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(beEmpty())
                        }
                    }
                }
            }
            
            context("which is not empty") {
                let container = [1, 2, 3]
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3]> to be empty"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).to(beEmpty())
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(container).toNot(beEmpty())
                    }
                }
            }
        }
        
        describe("when the value is a String") {
            context("which is empty") {
                let container = ""
                
                describe("positive match") {
                    it("should pass") {
                        expect(container).to(beEmpty())
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(beEmpty())
                        }
                    }
                }
            }
            
            context("which is not empty") {
                let container = "Not empty string"
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <Not empty string> to be empty"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).to(beEmpty())
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(container).toNot(beEmpty())
                    }
                }
            }
        }
        
        describe("when the value is a NSArray") {
            context("which is empty") {
                let container: NSArray = NSArray(array: [])
                
                describe("positive match") {
                    it("should pass") {
                        expect(container).to(beEmpty())
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <()> to not be empty"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).toNot(beEmpty())
                        }
                    }
                }
            }
            
            context("which is not empty") {
                let container: NSArray = NSArray(array: [1, 2, 3])
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <(1,2,3)> to be empty"
                        expectFailureWithMessage(failureMessage) {
                            expect(container).to(beEmpty())
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(container).toNot(beEmpty())
                    }
                }
            }
        }
    }
    
}