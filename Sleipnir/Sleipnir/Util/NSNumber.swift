//
//  NSNumber.swift
//  Sleipnir
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

extension NSNumber: Comparable, Equatable {
    
}

public func <(lhs: NSNumber, rhs: NSNumber) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending;
}

public func == (lhs: NSNumber, rhs: NSNumber) -> Bool {
    return lhs.isEqualToNumber(rhs)
}
