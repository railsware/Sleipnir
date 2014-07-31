//
//  CustomObject.swift
//  Sleipnir
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class CustomObject : Equatable, Printable, Comparable {
    
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    var description: String {
        return "CustomObject(\(self.value))"
    }
    
}

func ==(left: CustomObject, right: CustomObject) -> Bool {
    return left.value == right.value
}

func <(left: CustomObject, right: CustomObject) -> Bool {
    return left.value < right.value
}
