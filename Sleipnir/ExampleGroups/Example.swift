//
//  Example.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func it(label: String, block: () -> ()) -> NilType
{
    var example = Internal.Example(label, block)
    
    return nil
}

func fit(label: String, block: () -> ()) -> NilType
{
    var example = Internal.Example(label, block, Internal.ExampleType.Focused)
    
    return nil
}

func xit(label: String, block: () -> ()) -> NilType
{
    var example = Internal.Example(label, block, Internal.ExampleType.Excluded)
    
    return nil
}
