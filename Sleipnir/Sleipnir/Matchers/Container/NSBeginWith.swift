//
//  NSBeginWith.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public protocol NSOrderedContainer : NSContainer {
    
    func indexOfObject(object: AnyObject!) -> Int
    
}

extension NSArray : NSOrderedContainer { }

public class NSBeginWith<T: AnyObject> : BaseMatcher<NSOrderedContainer> {
    
    var item: T
    
    init(item: T) {
        self.item = item
        super.init()
    }
    
    override func match(actual: NSOrderedContainer?) -> Bool {
        return actual!.indexOfObject(item) == 0
    }
    
    override func failureMessageEnd() -> String {
        return "begin with <\(item)>"
    }
}

public func beginWith(item: AnyObject) -> NSBeginWith<AnyObject> {
    return NSBeginWith(item: item)
}