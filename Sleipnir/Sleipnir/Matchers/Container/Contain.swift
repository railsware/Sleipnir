//
//  Contain.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/18/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class Contain<S: SequenceType, T: Equatable where S.Generator.Element == T> : BaseMatcher<S> {
    
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
            return matchString(actual as String, item: stringItem!)
        } else {
            return matchSequence(actual!, item: item!)
        }
    }
    
    override func failureMessageEnd() -> String {
        var textItem = (item != nil) ? stringify(item) : stringify(stringItem)
        return "contain <\(textItem)>"
    }
    
    private func matchString(actual: String, item: String) -> Bool {
        return actual.rangeOfString(item) != nil
    }
    
    private func matchSequence(actual: S, item: T) -> Bool {
        return contains(actual, item)
    }
}

public func contain<S: SequenceType, T: Equatable where S.Generator.Element == T>(item: T) -> Contain<S, T> {
    return Contain(item: item)
}

public func contain(item: String) -> Contain<String, Character> {
    return Contain(stringItem: item)
}