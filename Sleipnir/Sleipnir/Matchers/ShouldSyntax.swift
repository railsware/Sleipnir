//
//  ShouldSyntax.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public extension NSObject {
    
    var should: NSObjectMatch { return match(true) }
    var shouldNot: NSObjectMatch { return match(false) }
    
    private func match(positive: Bool) -> NSObjectMatch {
        if self is NSSet {
            return SleipnirContainerMatch<NSSet>(value: self, positive: positive)
        } else if self is NSArray {
            return SleipnirOrderedContainerMatch<NSArray>(value: self, positive: positive)
        } else {
            return NSObjectMatch(value: self, positive: positive)
        }
    }
}

public extension Array {
    
    var should: ArrayMatch<T, NSArray> { return ArrayMatch(value: self, positive: true) }
    var shouldNot: ArrayMatch<T, NSArray> { return ArrayMatch(value: self, positive: false) }
    
}

public extension String {
    
    var should: StringMatch { return StringMatch(value: self, positive: true) }
    var shouldNot: StringMatch { return StringMatch(value: self, positive: false) }
    
}

public extension Optional  {
    
    var should: OptionalMatch { return OptionalMatch(value: self, positive: true) }
    var shouldNot: OptionalMatch { return OptionalMatch(value: self, positive: false) }
    
}

public extension Int {
    
    var should: IntMatch { return IntMatch(value: self, positive: true) }
    var shouldNot: IntMatch { return IntMatch(value: self, positive: false) }
    
}

public extension Double {
    
    var should: DoubleMatch { return DoubleMatch(value: self, positive: true) }
    var shouldNot: DoubleMatch { return DoubleMatch(value: self, positive: false) }
    
}

public extension Float {
    
    var should: FloatMatch { return FloatMatch(value: self, positive: true) }
    var shouldNot: FloatMatch { return FloatMatch(value: self, positive: false) }
    
}

public extension Bool {
    
    var should: BoolMatch { return BoolMatch(value: self, positive: true) }
    var shouldNot: BoolMatch { return BoolMatch(value: self, positive: false) }
    
}

public class StringMatch {
    
    var value: String
    var positive: Bool
    
    init(value: String, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func equal(expected: String, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }

    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }

    public func contain(item: String, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Contain(stringItem: item))
        } else {
            actualValue.toNot(Contain(stringItem: item))
        }
    }
    
    public func beginWith(item: String, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeginWith(stringItem: item))
        } else {
            actualValue.toNot(BeginWith(stringItem: item))
        }
    }
    
    public func endWith(item: String, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(EndWith(stringItem: item))
        } else {
            actualValue.toNot(EndWith(stringItem: item))
        }
    }
    
    public func beEmpty(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeEmpty())
        } else {
            actualValue.toNot(BeEmpty())
        }
    }
}

public class OptionalMatch {
    
    var value: Any?
    var positive: Bool
    
    init(value: Any?, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue<Any>(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }
}

public class IntMatch {
    
    var value: Int
    var positive: Bool
    
    init(value: Int, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func equal(expected: Int, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }
    
    public func beGreaterThan(expected: Int, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeGreaterThan(expected: expected))
        } else {
            actualValue.toNot(BeGreaterThan(expected: expected))
        }
    }
    
    public func beGreaterThanOrEqualTo(expected: Int, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeGreaterThanOrEqualTo(expected: expected))
        } else {
            actualValue.toNot(BeGreaterThanOrEqualTo(expected: expected))
        }
    }
    
    public func beLessThan(expected: Int, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeLessThan(expected: expected))
        } else {
            actualValue.toNot(BeLessThan(expected: expected))
        }
    }
    
    public func beLessThanOrEqualTo(expected: Int, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeLessThanOrEqualTo(expected: expected))
        } else {
            actualValue.toNot(BeLessThanOrEqualTo(expected: expected))
        }
    }
    
    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }
    
    public func beTrue(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeTrue())
        } else {
            actualValue.toNot(BeTrue())
        }
    }
    
    public func beFalse(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeFalse())
        } else {
            actualValue.toNot(BeFalse())
        }
    }
}

public class DoubleMatch {
    
    var value: Double
    var positive: Bool
    
    init(value: Double, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func equal(expected: Double, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }
    
    public func beGreaterThan(expected: Double, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeGreaterThan(expected: expected))
        } else {
            actualValue.toNot(BeGreaterThan(expected: expected))
        }
    }
    
    public func beGreaterThanOrEqualTo(expected: Double, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeGreaterThanOrEqualTo(expected: expected))
        } else {
            actualValue.toNot(BeGreaterThanOrEqualTo(expected: expected))
        }
    }
    
    public func beLessThan(expected: Double, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeLessThan(expected: expected))
        } else {
            actualValue.toNot(BeLessThan(expected: expected))
        }
    }
    
    public func beLessThanOrEqualTo(expected: Double, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeLessThanOrEqualTo(expected: expected))
        } else {
            actualValue.toNot(BeLessThanOrEqualTo(expected: expected))
        }
    }
    
    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }
    
    public func beTrue(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeTrue())
        } else {
            actualValue.toNot(BeTrue())
        }
    }
    
    public func beFalse(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeFalse())
        } else {
            actualValue.toNot(BeFalse())
        }
    }
}

public class FloatMatch {
    
    var value: Float
    var positive: Bool
    
    init(value: Float, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func equal(expected: Float, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }
    
    public func beGreaterThan(expected: Float, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeGreaterThan(expected: expected))
        } else {
            actualValue.toNot(BeGreaterThan(expected: expected))
        }
    }
    
    public func beGreaterThanOrEqualTo(expected: Float, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeGreaterThanOrEqualTo(expected: expected))
        } else {
            actualValue.toNot(BeGreaterThanOrEqualTo(expected: expected))
        }
    }
    
    public func beLessThan(expected: Float, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeLessThan(expected: expected))
        } else {
            actualValue.toNot(BeLessThan(expected: expected))
        }
    }
    
    public func beLessThanOrEqualTo(expected: Float, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeLessThanOrEqualTo(expected: expected))
        } else {
            actualValue.toNot(BeLessThanOrEqualTo(expected: expected))
        }
    }
    
    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }
    
    public func beTrue(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeTrue())
        } else {
            actualValue.toNot(BeTrue())
        }
    }
    
    public func beFalse(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeFalse())
        } else {
            actualValue.toNot(BeFalse())
        }
    }
}

public class BoolMatch {
    
    var value: Bool
    var positive: Bool
    
    init(value: Bool, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func equal(expected: Bool, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }
    
    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }
    
    public func beTrue(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeTrue())
        } else {
            actualValue.toNot(BeTrue())
        }
    }
    
    public func beFalse(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeFalse())
        } else {
            actualValue.toNot(BeFalse())
        }
    }
}

public class ArrayMatch<T, S: SleipnirOrderedContainer> {
    
    var value: Array<T>
    var positive: Bool
    
    init(value: Array<T>, positive: Bool) {
        self.value = value
        self.positive = positive
    }

    public func equal(expected: Array<T>, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }
    
    public func contain(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let nsValue : NSArray = value._bridgeToObjectiveC()
        let actualValue = ActualValue(value: nsValue as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSContain(item: item))
        } else {
            actualValue.toNot(NSContain(item: item))
        }
    }

    public func beginWith(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let nsValue : NSArray = value._bridgeToObjectiveC()
        let actualValue = ActualValue(value: nsValue as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSBeginWith(item: item))
        } else {
            actualValue.toNot(NSBeginWith(item: item))
        }
    }
    
    public func endWith(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let nsValue : NSArray = value._bridgeToObjectiveC()
        let actualValue = ActualValue(value: nsValue as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSEndWith(item: item))
        } else {
            actualValue.toNot(NSEndWith(item: item))
        }
    }

    public func beEmpty(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeEmpty())
        } else {
            actualValue.toNot(BeEmpty())
        }
    }
}

public class NSObjectMatch {
    
    var value: NSObjectProtocol
    var positive: Bool
    
    init(value: NSObjectProtocol, positive: Bool) {
        self.value = value
        self.positive = positive
    }
    
    public func equal(expected: NSObject, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? NSObject, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(Equal(expected: expected))
        } else {
            actualValue.toNot(Equal(expected: expected))
        }
    }
    
    public func beNil(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeNil())
        } else {
            actualValue.toNot(BeNil())
        }
    }
    
    public func beTrue(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeTrue())
        } else {
            actualValue.toNot(BeTrue())
        }
    }
    
    public func beFalse(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeFalse())
        } else {
            actualValue.toNot(BeFalse())
        }
    }

    public func contain(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        fail("Not implemented!", file: file, line: line)
    }

    public func beginWith(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        fail("Not implemented!", file: file, line: line)
    }

    public func endWith(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        fail("Not implemented!", file: file, line: line)
    }
    
    public func beEmpty(file: String = __FILE__, line: Int = __LINE__) {
        fail("Not implemented!", file: file, line: line)
    }
}

public class SleipnirContainerMatch<S: SleipnirContainer> : NSObjectMatch {
    
    init(value: NSObject, positive: Bool) {
        super.init(value: value, positive: positive)
    }
    
    override public func contain(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSContain(item: item))
        } else {
            actualValue.toNot(NSContain(item: item))
        }
    }
    
    override public func beEmpty(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? S, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeEmpty())
        } else {
            actualValue.toNot(BeEmpty())
        }
    }
}

public class SleipnirOrderedContainerMatch<S: SleipnirOrderedContainer> : NSObjectMatch {
    
    init(value: NSObject, positive: Bool) {
        super.init(value: value, positive: positive)
    }
    
    override public func contain(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSContain(item: item))
        } else {
            actualValue.toNot(NSContain(item: item))
        }
    }

    override public func beginWith(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSBeginWith(item: item))
        } else {
            actualValue.toNot(NSBeginWith(item: item))
        }
    }

    override public func endWith(item: AnyObject, file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? S, fileName: file, lineNumber: line)
        
        if positive {
            actualValue.to(NSEndWith(item: item))
        } else {
            actualValue.toNot(NSEndWith(item: item))
        }
    }
    
    override public func beEmpty(file: String = __FILE__, line: Int = __LINE__) {
        let actualValue = ActualValue(value: value as? S, fileName: file, lineNumber: line)
        if positive {
            actualValue.to(BeEmpty())
        } else {
            actualValue.toNot(BeEmpty())
        }
    }
}