//
//  Reporter.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

protocol Reporter {

    func runWillStart(randomSeed seed: Int)
    
    func runDidComplete()
    
    func runWillStartExampleGroup(group: ExampleGroup)
    
    func runDidFinishExampleGroup(group: ExampleGroup)
    
    func runWillStartExample(example: Example)
    
    func runDidFinishExample(example: Example)
    
    func result() -> Int
}