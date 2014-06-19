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
            
            it("should") { println("EXAMPLE RUN FIRST") }
            it("work") { println("EXAMPLE RUN SECOND") }
            
            describe("internal second") {
                
                beforeAll { println("BEFORE ALL RUN, describe = internal second") }
                
                beforeEach { println("INTERNAL BEFORE EACH RUN") }
                afterEach { println("INTERNAL AFTER EACH RUN") }
                
                it("internal") { println("INTERNAL EXAMPLE RUN FIRST") }
            }
            
        }
        
    }
}
