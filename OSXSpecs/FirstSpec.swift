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
        
        beforeAll { println("BEFORE ALL RUN, describe = toplevel first") }

        describe("first") {
            
            beforeAll { println("BEFORE ALL RUN, describe = first") }
            
        }
        
        describe("second") {
            
            beforeAll { println("BEFORE ALL RUN, describe = second") }
            
            beforeEach { println("BEFORE EACH RUN") }
            afterEach { println("AFTER EACH RUN") }
            
            it("first") { println("EXAMPLE RUN 1") }
            it("second") { println("EXAMPLE RUN 2") }
            it("third") { println("EXAMPLE RUN 3") }
            it("fourth") { println("EXAMPLE RUN 4") }
            it("fifth") { println("EXAMPLE RUN 5") }
            
            describe("internal second") {
                
                beforeAll { println("BEFORE ALL RUN, describe = internal second") }
                
                beforeEach { println("INTERNAL BEFORE EACH RUN") }
                afterEach { println("INTERNAL AFTER EACH RUN") }
                
                it("internal") { println("INTERNAL EXAMPLE RUN 1") }
            }
            
        }
        
    }
}
