//
//  ExampleGroup.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func describe(label: String, block: () -> ()) -> NilType
{
    var group = Internal.ExampleGroup(label, block)
    
    return nil
}

func fdescribe(label: String, block: () -> ()) -> NilType
{
    var group = Internal.ExampleGroup(label, block, Internal.ExampleType.Focused)
    
    return nil
}

func xdescribe(label: String, block: () -> ()) -> NilType
{
    var group = Internal.ExampleGroup(label, block, Internal.ExampleType.Excluded)
    
    return nil
}
