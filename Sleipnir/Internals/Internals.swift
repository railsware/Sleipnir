//
//  Internals.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

struct Internal
{
    typealias SleipnirBlock = () -> ()
}

extension Internal {
    
    enum ExampleType {
        case Normal
        case Focused
        case Excluded
    }
    
}

extension Internal {
    
    class ExampleGroup {
        
        var label: String
        var type: ExampleType
        var block: SleipnirBlock
        
        init(_ label: String,
             _ block: SleipnirBlock,
             _ type: ExampleType = ExampleType.Normal)
        {
            self.label = label
            self.block = block
            self.type = type
        }
        
    }
    
}

extension Internal {
    
    class Example {
        
        var label: String
        var type: ExampleType
        var block: SleipnirBlock
        
        init(_ label: String,
             _ block: SleipnirBlock,
             _ type: ExampleType = ExampleType.Normal)
        {
            self.label = label
            self.block = block
            self.type = type
        }
        
    }
    
}

