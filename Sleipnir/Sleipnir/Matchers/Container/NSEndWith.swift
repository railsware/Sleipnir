//
//  NSEndWith.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class NSEndWith<T: AnyObject> : BaseMatcher<SleipnirOrderedContainer> {
    
    var item: T
    
    init(item: T) {
        self.item = item
        super.init()
    }
    
    override func match(actual: SleipnirOrderedContainer?) -> Bool {
        return actual!.indexOfObject(item) == actual!.count - 1
    }
    
    override func failureMessageEnd() -> String {
        return "end with <\(item)>"
    }
}

public func endWith(item: AnyObject) -> NSEndWith<AnyObject> {
    return NSEndWith(item: item)
}