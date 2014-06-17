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

        beforeAll {}

        describe("goodbye") {

            beforeAll {}
            
        }
        
        describe("hello again") {
            
            beforeEach {}
            afterEach {}
            
            it("should") {}
            it("work") {}
            
        }
        
    }
}
