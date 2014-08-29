//
//  BeIdenticalToSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 8/29/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class BeIdenticalToSpec : SleipnirSpec {
    
    var beIdenticalToSpec : () = fdescribe("BeIdenticalTo matcher") {
        
        describe("when the value is an Int") {
            let actualValue : NSNumber = NSNumber.numberWithInteger(1)
            var expectedValue : NSNumber = NSNumber.numberWithInteger(1)
            
            describe("and the values are identical") {
                beforeEach {
//                    expectedValue = NSNumber.numberWithInteger(1)
                }
                
                context("positive match") {
                    it("should pass") {
//                        expect(actualValue).to(beIdenticalTo(expectedValue))
                        let value1 = NSArray(array: [])
                        let value2 = NSArray(array: [])
                        
                        let num1 = NSNumber.numberWithInteger(1)
                        let num2 = NSNumber.numberWithInteger(1)
                        expect("d").to(beIdenticalTo("ff"))
                        
//                        expect("ara").to(beIdenticalTo("ara"))
//                        expect(value1).toNot(beIdenticalTo(value2))
                        let result = value1 === value2
                        println(result)
                    }
                }
                
                context("negative match") {
                    
                }
            }
        }
    }
    
}
