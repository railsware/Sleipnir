//
//  Array.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/19/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

extension Array {
    
    func shuffle() {
        for var i = self.count - 1; i >= 1; i-- {
            let j = Int(arc4random_uniform(UInt32(i + 1)))
            swap(&self[i], &self[j])
        }
    }
    
}