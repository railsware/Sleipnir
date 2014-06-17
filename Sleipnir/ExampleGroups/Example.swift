//
//  Example.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func it(label: String, block: () -> ())
{
    var example = Internal.Example(label, block)
    Internal.handleExample(example)
}

func fit(label: String, block: () -> ())
{
    var example = Internal.Example(label, block, Internal.ExampleType.Focused)
    Internal.handleExample(example)
}

func xit(label: String, block: () -> ())
{
    var example = Internal.Example(label, block, Internal.ExampleType.Excluded)
    Internal.handleExample(example)
}
