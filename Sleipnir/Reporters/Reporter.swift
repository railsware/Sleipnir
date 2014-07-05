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
    
    func runWillStartWithGroup(group: Internal.ExampleGroup)
    
    func runDidCompleteWithGroup(group: Internal.ExampleGroup)
    
//    - (void)runWillStartExample:(CDRExample *)example;
//    - (void)runDidFinishExample:(CDRExample *)example;
//    
//    - (void)runWillStartExampleGroup:(CDRExampleGroup *)exampleGroup;
//    - (void)runDidFinishExampleGroup:(CDRExampleGroup *)exampleGroup;
//    
//    - (void)runWillStartSpec:(CDRSpec *)spec;
//    - (void)runDidFinishSpec:(CDRSpec *)spec;
    
}