//
//  ExampleGroup.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/13/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func beforeAll(block: () -> () )
{
    Internal.handleBeforeAll(block)
}

func beforeEach(block: () -> () )
{
    Internal.handleBeforeEach(block)
}

func afterAll(block: () -> () )
{
    Internal.handleAfterAll(block)
}

func afterEach(block: () -> () )
{
    Internal.handleAfterEach(block)
}

func describe(label: String, block: () -> ())
{
    var group = Internal.ExampleGroup(label, block)
    Internal.handleGroup(group)
}

func fdescribe(label: String, block: () -> ())
{
    var group = Internal.ExampleGroup(label, block, Internal.ExampleType.Focused)
    Internal.handleGroup(group)
}

func xdescribe(label: String, block: () -> ())
{
    var group = Internal.ExampleGroup(label, block, Internal.ExampleType.Excluded)
    Internal.handleGroup(group)
}
