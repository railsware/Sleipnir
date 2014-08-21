### `should` and `shouldNot` syntax

Should syntax provides another way of writing expectations.
```swift
let actual = 3
let expected = 3
actual.should.equal(expected)
```

`should` and `shouldNot` work by being added to every object through extensions.<br>
They can be used to define expectations on any object:
```swift
"Sleipnir".shouldNot.beEmpty()
[1, 2, 3].should.contain(3)
```
This syntax has some known limitations.<br>
It can not be used with custom pure swift classes, because `AnyObject` is a protocol and protocols can not be extended in Swift.<br>

Both `should` and `expect` are supported and available. Using one of them or both is a matter of preference.

### Using Built-in matchers

##### Equal
Values must be [`Equatable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Equatable.html), [`Comparable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Comparable.html) or derive from `NSObject`.
```swift
let actual = [1, 2, 3]
actual.should.equal([1, 2, 3])
"some string".shouldNot.equal("another string")
```

##### BeNil
```swift
let actual : String? = nil
actual.should.beNil()
"some string".shouldNot.beNil()
```

##### BeTrue/BeFalse
```swift
let actual = true
actual.should.beTrue()
actual.shouldNot.beFalse()
```

##### BeGreaterThan/BeLessThan
Values must be [`Comparable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Comparable.html).
```swift
3.should.beGreaterThan(1)
1.should.beLessThan(3)
```

##### BeGreaterThanOrEqualTo/BeLessThanOrEqualTo
Values must be [`Comparable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Comparable.html).
```swift
3.should.beGreaterThanOrEqualTo(1)
1.should.beLessThanOrEqualTo(3)
```

##### Collections/String matchers

##### Contain
Supports Swift collections with [`Equatable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Equatable.html) elements, `NSArrays`, `NSSets` and `Strings`.
```swift
let actual = [1, 2, 3]
actual.should.contain(1)
"some string".shouldNot.contain("another")
```

##### BeginWith/EndWith
Supports Swift collections with `Equatable` elements, `NSArrays` and `Strings`.
```swift
let actual = [1, 2, 3]
actual.should.beginWith(1)
"some string".should.endWith("string")
```

##### BeEmpty
```swift
"".should.beEmpty()
[1,2,3].shouldNot.beEmpty()
```
