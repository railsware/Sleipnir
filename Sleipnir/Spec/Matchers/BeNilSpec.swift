//
//  BeNilSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/16/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeNilSpec : SleipnirSpec {
    
    var beNilSpec : () = describe("BeNil matcher") {
     
        context("value") {
            var value: Int?
            
            describe("which is nil") {
                beforeEach {
                    value = nil
                }
                
                describe("positive match") {
                    it("should pass") {
                        expect(value).to(beNil())
                    }
                }
                
                describe("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <nil> to not be nil"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).toNot(beNil())
                        }
                    }
                }
            }
            
            describe("which is not nil") {
                beforeEach {
                    value = 3
                }
                
                describe("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to be nil"
                        expectFailureWithMessage(failureMessage) {
                            expect(value).to(beNil())
                        }
                    }
                }
                
                describe("negative match") {
                    it("should pass") {
                        expect(value).toNot(beNil())
                    }
                }
            }
        }
        
    }
    
}