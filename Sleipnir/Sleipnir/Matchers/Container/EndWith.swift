//
//  EndWith.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class EndWith<S: SequenceType, T: Equatable where S.Generator.Element == T> : BaseMatcher<S> {
    
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
        return "end with <\(textItem)>"
    }
    
    private func matchString(actual: String, item: String) -> Bool {
        let range = actual.rangeOfString(item)
        if range == nil {
            return false
        }
        
        return range!.endIndex == actual.endIndex
    }
    
    private func matchSequence(actual: S, item: T) -> Bool {
        var actualGenerator = actual.generate()
        
        var lastItem: T?
        while let item = actualGenerator.next() {
            lastItem = item
        }
        
        return lastItem == item
    }
}

public func endWith<S: SequenceType, T: Equatable where S.Generator.Element == T>(item: T) -> EndWith<S, T> {
    return EndWith(item: item)
}

//public func endWith(item: String) -> EndWith<String, Character> {
//    return EndWith(stringItem: item)
//}