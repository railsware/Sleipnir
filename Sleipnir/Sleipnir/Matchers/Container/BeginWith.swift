//
//  BeginWith.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class BeginWith<S: SequenceType, T: Equatable where S.Generator.Element == T> : BaseMatcher<S> {

    var item: T?
    var stringItem: String?
    
    init(item: T) {
        self.item = item
        super.init()
    }
    
    init(stringItem: String) {
        self.stringItem = stringItem
        super.init()
    }
    
    override func match(actual: S?) -> Bool  {
        if actual == nil {
            return false
        }
        
        if (actual is String && stringItem != nil) {
            return matchString(actual as! String, item: stringItem!)
        } else {
            return matchSequence(actual!, item: item!)
        }
    }
    
    override func failureMessageEnd() -> String {
        let textItem = (item != nil) ? stringify(item) : stringify(stringItem)
        return "begin with <\(textItem)>"
    }
    
    private func matchString(actual: String, item: String) -> Bool {
        let range = actual.rangeOfString(item)
        if range == nil {
            return false
        }
        
        return range!.startIndex == actual.startIndex
    }
    
    private func matchSequence(actual: S, item: T) -> Bool {
        var actualGenerator = actual.generate()
        return actualGenerator.next() == item
    }
}

public func beginWith<S: SequenceType, T: Equatable where S.Generator.Element == T>(item: T) -> BeginWith<S, T> {
    return BeginWith(item: item)
}

//public func beginWith(item: String) -> BeginWith<String, Character> {
//    return BeginWith(stringItem: item)
//}