//
//  ExampleSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation
import Sleipnir

class ExampleSpec : SleipnirSpec {
    
    var exampleSpec : () = describe("Example") {
        
        var example: Example?
        let exampleText = "exampleText"
        beforeEach {
            example = Example(exampleText, {})
        }
        
        describe("fullText") {
            context("with no parent") {
                
                it("should return just its own text") {
                    expect(example!.fullText()).to(equal(exampleText))
                }
            }
            
            context("with a parent") {
             
                var group: ExampleGroup?
                let groupText = "Parent"
                beforeEach {
                    group = ExampleGroup(groupText, {})
                    group!.addExample(example!)
                    example!.group = group
                }
                
                it("should return its parent's text prepended with its own text") {
                    let expectedFullText = groupText + " " + exampleText
                    expect(example!.fullText()).to(equal(expectedFullText))
                }
                
                describe("when the parent also has a parent") {
                    
                    var rootGroup: ExampleGroup?
                    let rootGroupText = "Root"
                    beforeEach {
                        rootGroup = ExampleGroup(rootGroupText, {})
                        rootGroup!.addChildGroup(group!)
                    }
                    
                    it("should include the text from all parents, pre-pended in the appropriate order") {
                        let expectedFullText = rootGroupText + " " + groupText + " " + exampleText
                        expect(example!.fullText()).to(equal(expectedFullText))
                    }
                }
            }
        }
    }
}