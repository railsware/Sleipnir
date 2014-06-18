//
//  FirstSpec.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/16/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class FirstSpec : SleipnirSpec {
    var x : () = describe("hello") {

        beforeAll { println("BEFORE ALL RUN") }

        describe("goodbye") {
            
            beforeAll { println("BEFORE ALL RUN") }
            
        }
        
        describe("hello again") {
            
            beforeEach { println("BEFORE EACH RUN") }
            afterEach { println("AFTER EACH RUN") }
            
            it("should") { println("EXAMPLE RUN") }
            it("work") { println("EXAMPLE RUN") }
            
        }
        
    }
}
