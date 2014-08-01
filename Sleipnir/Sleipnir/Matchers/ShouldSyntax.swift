//
//  ShouldSyntax.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Should<T> {
    
    var value: T?
    
    init(value: T) {
        self.value = value
    }
    
    func equal(expected: T, file: String = __FILE__, line: Int = __LINE__) {
        ActualValue(value: value, fileName: file, lineNumber: line).to(equal(expected))
    }
}

extension Int {
    
    var should: Should<Int> { return Should(value: self) }
    
}

//extension NSObject {
// 
//    func should(matcher: BaseMatcher<NSObject>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.to(matcher)
//    }
//    
//    func shouldNot(matcher: BaseMatcher<NSObject>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.toNot(matcher)
//    }
//    
//}

//extension Int {
//    
//    func should(matcher: BaseMatcher<Int>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.to(matcher)
//    }
//    
//    func shouldNot(matcher: BaseMatcher<Int>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.toNot(matcher)
//    }
//    
//}
//
//extension Double {
//    
//    func should(matcher: BaseMatcher<Double>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.to(matcher)
//    }
//    
//    func shouldNot(matcher: BaseMatcher<Double>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.toNot(matcher)
//    }
//    
//}
//
//extension Float {
//    
//    func should(matcher: BaseMatcher<Float>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.to(matcher)
//    }
//    
//    func shouldNot(matcher: BaseMatcher<Float>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.toNot(matcher)
//    }
//    
//}
//
//extension Bool {
//    
//    func should(matcher: BaseMatcher<Bool>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.to(matcher)
//    }
//    
//    func shouldNot(matcher: BaseMatcher<Bool>, file: String = __FILE__, line: Int = __LINE__) {
//        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
//        actualValue.toNot(matcher)
//    }
//    
//}
//
//extension Array {
//    
//    func should(matcher: BaseMatcher<[T]>, file: String = __FILE__, line: Int = __LINE__) {
//        let actual = ActualValue(value: self, fileName: file, lineNumber: line)
//        actual.to(matcher)
//    }
//
//    func shouldNot(matcher: BaseMatcher<[T]>, file: String = __FILE__, line: Int = __LINE__) {
//        let actual = ActualValue(value: self, fileName: file, lineNumber: line)
//        actual.toNot(matcher)
//    }
//    
//}