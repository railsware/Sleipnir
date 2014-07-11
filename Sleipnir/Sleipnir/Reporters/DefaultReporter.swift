//
//  DefaultReporter.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class DefaultReporter : Reporter {
    
    var startTime: NSDate?
    var endTime: NSDate?
    
    var examplesCount: Int = 0
    
    var failureMessages: String[]
    
    init() {
        failureMessages = String[]()
    }
    
    func runWillStart(randomSeed seed: Int) {
        startTime = NSDate()
        println("Running With Random Seed: \(seed)\n")
    }
    
    func runDidComplete() {
        endTime = NSDate()
        
        println()
        printMessages(failureMessages)
        printStats()
    }
    
    func runWillStartExampleGroup(group: ExampleGroup) {
        startObservingExamples(group.examples)
    }
    
    func runDidFinishExampleGroup(group: ExampleGroup) {
        stopObservingExamples(group.examples)
    }
    
    func runWillStartExample(example: Example) {
    }
    
    func runDidFinishExample(example: Example) {
    }
    
    // Private
    
    func successToken() -> String {
        return "."
    }
    
    func failureToken() -> String {
        return "F"
    }
    
    func errorToken() -> String {
        return "E"
    }
    
    func failureMessageForExample(example: Example) -> String {
        return "FAILURE " + example.fullText() + ":\n" + example.failure() + "\n"
    }
    
    func printMessages(messages: String[]) {
        println()
        
        for message in messages {
            println(message)
        }
    }
    
    func printStats() {
        let time = NSString(format: "%.4f", endTime!.timeIntervalSinceDate(startTime))
        println("\nFinished in \(time) seconds\n")
        println("\(examplesCount) examples, \(failureMessages.count) failures\n")
    }
    
    func startObservingExamples(examples: Example[]) {
        for example in examples {
            var exampleObserver: Observable<ExampleState>.Observer = ({
                (newValue: ExampleState) -> () in
                self.reportOnExample(example)
            })
            
            example.state.addObserver("state_observer", observer: exampleObserver)
            examplesCount++
        }
    }
    
    func stopObservingExamples(examples: Example[]) {
        for example in examples {
            example.state.removeObserver("state_observer")
        }
    }
    
    func reportOnExample(example: Example) {
        var stateToken: String = ""
    
        switch example.state.get() {
        case ExampleState.Passed:
            stateToken = successToken()
        case ExampleState.Error:
            stateToken = errorToken()
        case ExampleState.Failed:
            stateToken = failureToken()
            failureMessages.append(failureMessageForExample(example))
        default:
            break;
        }
        
        print(stateToken)
    }
}