//
//  SpecFailure.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/26/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class SpecFailure {
    
    var fileName: String?
    var lineNumber: Int?
    var reason: String
    
    init(reason: String) {
        self.reason = reason
    }
    
    init(reason: String, fileName: String, lineNumber: Int) {
        self.reason = reason
        self.fileName = fileName
        self.lineNumber = lineNumber
    }
    
    func failure() -> String {
        return "\(fileName):\(lineNumber) \(reason)"
    }
}