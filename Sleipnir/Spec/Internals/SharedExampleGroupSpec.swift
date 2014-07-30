//
//  SharedExampleGroupSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/30/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

var globalValue: AnyObject? = nil

class SharedExampleGroupSpec : SleipnirSpec {
    
    var groupWithBeforeEach : () =
    sharedExamplesFor("a describe context that contains a beforeEach in a shared example group") {
        
        beforeEach {
            globalValue = "Not Nil"
        }
        
        it("should run the shared beforeEach before specs inside the shared example group") {
            expect(globalValue).toNot(beNil())
        }
    }
    
    var groupWithContext : () =
    sharedExamplesFor("a shared example group that receives a value in the context") {
        (sharedContext : SharedContext) in
        
        var value: String? = nil
        beforeEach {
            value = sharedContext()["value"] as? String
        }
        
        it("should receive the values set in the shared example context") {
            expect(value).to(equal("Some String"))
        }
    }
    
    var groupWithFailure : () = sharedExamplesFor("a shared example group that contains a failing spec") {
        it("should fail with a sensible failure message") {
            let failureMessage = "Expected <some> to equal <string>"
            expectFailureWithMessage(failureMessage) {
                expect("some").to(equal("string"))
            }
        }
    }
    
    var sharedExamplesSpec : () = describe("a describe block") {
        
        beforeEach {
            globalValue = nil
        }
        
        describe("that contains a beforeEach in a shared example group") {
            itShouldBehaveLike("a describe context that contains a beforeEach in a shared example group")
            
            it("should not run the shared beforeEach before specs outside the shared example group") {
                expect(globalValue).to(beNil())
            }
        }
        
        describe("that passes a value to the shared example context") {
            itShouldBehaveLike("a shared example group that receives a value in the context", { ["value" : "Some String"] })
        }
        
        itShouldBehaveLike("a shared example group that contains a failing spec")
    }
}