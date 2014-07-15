//
//  ShouldSyntax.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

extension NSObject {
 
    func should(matcher: BaseMatcher<NSObject>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.to(matcher)
    }
    
    func shouldNot(matcher: BaseMatcher<NSObject>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.toNot(matcher)
    }
    
}

extension Int {
    
    func should(matcher: BaseMatcher<Int>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.to(matcher)
    }
    
    func shouldNot(matcher: BaseMatcher<Int>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.toNot(matcher)
    }
    
}

extension Double {
    
    func should(matcher: BaseMatcher<Double>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.to(matcher)
    }
    
    func shouldNot(matcher: BaseMatcher<Double>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.toNot(matcher)
    }
    
}

extension Float {
    
    func should(matcher: BaseMatcher<Float>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.to(matcher)
    }
    
    func shouldNot(matcher: BaseMatcher<Float>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.toNot(matcher)
    }
    
}

extension Bool {
    
    func should(matcher: BaseMatcher<Bool>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.to(matcher)
    }
    
    func shouldNot(matcher: BaseMatcher<Bool>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: self, fileName: file, lineNumber: line)
        actualValue.toNot(matcher)
    }
    
}

// Array extension won't work in XCode6-Beta3 due to compiler bug
// https://devforums.apple.com/message/983747
// Uncomment corresponding specs in 'ShouldSyntaxSpec' when bug is fixed
extension Array {
    
    func should(matcher: BaseMatcher<[T]>, file: String = __FILE__, line: Int = __LINE__) {
        let actual = ActualValue(value: self, fileName: file, lineNumber: line)
        actual.to(matcher)
    }

    func shouldNot(matcher: BaseMatcher<[T]>, file: String = __FILE__, line: Int = __LINE__) {
        let actual = ActualValue(value: self, fileName: file, lineNumber: line)
        actual.toNot(matcher)
    }
    
}