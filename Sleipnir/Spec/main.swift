//
//  main.swift
//  Spec
//
//  Created by Artur Termenji on 7/9/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

Runner.run()

func ident<T: AnyObject>(lhs: T?, rhs: T?) -> Bool {
    return lhs === rhs
}

//println(ident("ara", "ara"))
//println(ident(1,1))
//
//let num1 = NSNumber.numberWithInteger(1)
//let num2 = NSNumber.numberWithInteger(1)
//
//println(ident(num1, num2))