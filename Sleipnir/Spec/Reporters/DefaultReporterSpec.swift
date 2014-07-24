//
//  DefaultReporterSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/10/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class DefaultReporterSpec : SleipnirSpec {
    
    var defaultReporterSpec : () = describe("DefaultReporter") {
        
        var reporter: DefaultReporter?
        beforeEach {
            reporter = DefaultReporter()
        }
        
        context("when adding one group") {
            
            var group: ExampleGroup?
            beforeEach {
                group = ExampleGroup("Root group", {})
            }
            
            context("with one child 'it' example") {
                beforeEach {
                    let example = Example("example", {})
                    group!.addExample(example)
                }
                
                it("exampleCount shoud be 1") {
                    reporter!.runWillStartExampleGroup(group!)
                    reporter!.runDidFinishExampleGroup(group!)
                    expect(reporter!.examplesCount).to(equal(1))
                }
            }
            
            context("with no child 'it' examples") {
                it("exampleCount should be 0") {
                    reporter!.runWillStartExampleGroup(group!)
                    reporter!.runDidFinishExampleGroup(group!)
                    expect(reporter!.examplesCount).to(equal(0))
                }
            }
        }
    }
    
}