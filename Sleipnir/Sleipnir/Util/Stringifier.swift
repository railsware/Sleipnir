//
//  Stringifier.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

func stringify<T>(object: T?) -> String {
    var result = "nil"
    if object {
        result = "\(object!)"
    }
    
    return result
}