//
//  SpecFailureSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/11/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class SpecFailureSpec : SleipnirSpec {
    
    var specFailureSpec : () = describe("SpecFailure") {
        
        var failure: SpecFailure?
        let reason = "reason"
        let fileName = "File.swift"
        let lineNumber = 42

        describe("failure") {
            context("for a failure instantiated only with a reason") {
                beforeEach {
                    failure = SpecFailure(reasonRaw: "reason")
                }
                
                it("should return failure's reason") {
                    expect(failure!.failure()).to(equal(reason))
                }
            }
            
            context("for a failure instantiated with reason, file name and line number") {
                beforeEach {
                    failure = SpecFailure(reasonRaw: "reason", fileName: "File.swift", lineNumber: 42)
                }
                
                it("should return failure's reason with file name and line number") {
                    expect(failure!.failure()).to(equal("\(fileName):\(lineNumber) \(reason)"))
                }
            }
        }
    }
    
}