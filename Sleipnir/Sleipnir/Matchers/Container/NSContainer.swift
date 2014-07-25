//
//  NSContainer.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public protocol NSContainer {
    
    var count: Int { get }
    
    func containsObject(anObject: AnyObject!) -> Bool
    
}

public protocol NSOrderedContainer : NSContainer {
    
    func indexOfObject(object: AnyObject!) -> Int
    
}

extension NSArray : NSOrderedContainer { }
extension NSSet : NSContainer { }