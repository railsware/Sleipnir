//
//  NSContain.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/23/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class NSContain<T: AnyObject> : BaseMatcher<SleipnirContainer> {
    
    var items: [T]
    
    init(items: [T]) {
        self.items = items
        super.init()
    }
    
    override func match(actual: SleipnirContainer?) -> Bool {
        var result = true
        
        for item in items {
            if !(actual!.containsObject(item)) {
                result = false
            }
        }
        
        return result
    }
    
    override func failureMessageEnd() -> String {
        return "contain <\(items)>"
    }
}

public func contain(items: AnyObject...) -> NSContain<AnyObject> {
    return NSContain(items: items)
}