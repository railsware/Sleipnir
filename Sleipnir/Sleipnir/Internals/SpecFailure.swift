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
    var reasonRaw: String
    
    var reason: String {
    get {
        return trimReason(reasonRaw)
    }
    }
    
    init(reasonRaw: String) {
        self.reasonRaw = reasonRaw
    }
    
    init(reasonRaw: String, fileName: String, lineNumber: Int) {
        self.reasonRaw = reasonRaw
        self.fileName = fileName
        self.lineNumber = lineNumber
    }
    
    func failure() -> String {
        if fileName && lineNumber {
            return "\(fileName!):\(lineNumber!) \(reason)"
        } else {
            return reason
        }
    }
    
    func trimReason(reason: String) -> String {
        var lines: [String] = (reason as NSString).componentsSeparatedByString("\n") as [String]
        let whitespace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        lines = lines.map { line in line.stringByTrimmingCharactersInSet(whitespace) }
        return  "".join(lines)
    }
}