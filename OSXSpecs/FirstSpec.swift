//
//  FirstSpec.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/16/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class FirstSpec : SleipnirSpec {
    var x : () = describe("toplevel first") {
        
        beforeAll { }

        describe("first") {
            
            beforeAll {  }
            
            it("expect test") {
                var actual = [1,2,3]
                var expected = [1,2,3]
                expect(actual).to(equal(expected))
                
                expect(4 % 2 == 0).toNot(beTrue())
            }
            
        }
        
        describe("second") {
            
            var actualString = "actual"
            var expectedString = "another"
            
            beforeAll {  }
            
            beforeEach {  }
            afterEach {  }
            
            it("first") {
                expect(actualString).to(equal(expectedString))
            }
            
            it("second") {  }
            it("third") {  }
            it("fourth") {  }
            it("fifth") {  }
            
            describe("internal second") {
                
                beforeAll {  }
                
                beforeEach {  }
                afterEach {  }
                
                it("internal") {  }
            }
            
        }
        
    }
}
