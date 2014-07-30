<p align="center">
  <img height="300" width="300" src="https://raw.githubusercontent.com/railsware/Sleipnir/master/logo.png?token=1188140__eyJzY29wZSI6IlJhd0Jsb2I6cmFpbHN3YXJlL1NsZWlwbmlyL21hc3Rlci9sb2dvLnBuZyIsImV4cGlyZXMiOjE0MDUwOTM4OTV9--254f257f306a84328943af0ef0f2b94d1d286c0f" />
</p>

# Sleipnir

Sleipnir is a BDD-style framework for Swift. Sleipnir is highly inspired by [Cedar](https://github.com/pivotal/cedar). 
Also
> In Norse mythology, [Sleipnir](http://en.wikipedia.org/wiki/Sleipnir) is Odin's steed, is the child of Loki and Svaðilfari, is described as the best of all horses, and is sometimes ridden to the location of Hel. 
  
```swift
class SampleSpec : SleipnirSpec {
    var spec : () = describe("Horse") {
        context("usual") {
            it("is not awesome") {
                let usualHorse = UsualHorse()
                usualHorse.legsCount.should(equal(4))
                expect(usualHorse.isAwesome()).to(beFalse())
            }
        }
        
        context("Sleipnir") {
            it("is awesome") {
                let sleipnirHorse = Sleipnir()
                sleipnirHorse.legsCount.should(equal(8))
                expect(sleipnirHorse.isAwesome()).to(beTrue())
            }
        }
    }
}
```
## Core principles

* Sleipnir is not dependent of ```NSObject```, it is pure Swift BDD testing framework
* Sleipnir is not using ```XCTest```
* Sleipnir has nice command line output and support for custom test reporters
* Other features, like seeded random tests invocation, focused and excluded examples/groups, etc.

## Installation

#### Manually (preferred way)

1. Add Sleipnir as a submodule: `git submodule add https://github.com/railsware/sleipnir ThirdParty/Sleipnir`
2. Drag'n'drop `Sleipnir.xcodeproj` to your test target
3. Link `Sleipnir.framework`
4. Start writing specs!

#### Via CocoaPods

You can install statically built `Sleipnir.framework` into you project simply by adding it to the `Podfile`

```
pod 'Sleipnir'
```

**Note: it is experimental way** 

**Current build doesn't work on iPhone Simulator, but works for OSX and iOS Devices**

It will work well with pure Swift project, but it won't work in case you mix Swift and ObjC.
Swift compiler recognizes custom built framework without any issues, but when you're including auto-generated header "ProjectName-Swift.h" it tries to include the framework into ObjC universe, which currently doesn't work.

## Usage sample

See [LibrarySpec](https://github.com/railsware/Sleipnir/blob/master/Sample/Sample/LibrarySpec.swift) file in [Sample](https://github.com/railsware/Sleipnir/tree/master/Sample/Sample) project.

## Writing specs

All spec classes should inherit from `SleipnirSpec`.

Root ExampleGroups in a spec should be assigned to some void variable. This allows specs to initialize correctly:
```swift
import Sleipnir

class SomeSpec : SleipnirSpec {
 
    let someSpec : () = describe("Some spec") {
        it("should pass") {
            expect(1).to(equal(1))
        }
    }
    
}
```
## Running specs

In order to run your specs you should invoke `Runner.run()` from the `main.swift` of your test target.

The default test runner will produce the following command line output, indicating all the failures and some meta information about each failure:
```
Running With Random Seed: 1234

.....F..


FAILURE Some spec should pass:
/Path/To/Your/Specs/TestSpec.swift:16 Expected <1> to equal <2>


Finished in 0.0075 seconds

8 examples, 1 failures
```

### Seeded random specs run

All examples would run in random order with the random seed specified in output. If you would like to re-run tests in the same order you should pass a seed to `run()` method:
```swift
Runner.run(seed: 1234)
```

## Examples and ExampleGroups

ExampleGroups are created with `describe` or `context` keywords.
Within the block passed to ExampleGroup you can declare examples using the `it` keyword.

ExampleGroups can be nested in order to create clean structure of your tests.

Under the hood `describe` method creates an instance of `ExampleGroup` and evaluates the block passed to it. Blocks passed to examples are evaluated dynamically during the test execution.

## Setup/Teardown code

Sleipnir supports some hooks to execute before or after examples. This allows to share some setup/teardown code between examples.

`beforeEach` block will be executed before each example in the current group and all nested groups.

`afterEach` block will be executed after each example.

```swift
class SomeSpec : SleipnirSpec {
 
    let someSpec : () = describe("Some spec") {
        var someArray: [Int]?
        beforeEach {
            someArray = [1, 2, 3]
        }
        
        afterEach {
            someArray = nil
        }
        
        it("should pass") {
            expect(someArray).toNot(beNil())
            expect(someArray).to(contain(3))
        }
    }
    
}
```
You can also specify global setup/teardown blocks using `beforeAll` and `afterAll` keywords. 
They will run once before or after all examples in the current group and all the nested groups.

## Focused and excluded specs

You can specify examples and example groups to be focused by placing `f` letter before declaration: `fdescribe`, `fcontext`, `fit`. In this case the spec runner will only run focused examples/example groups and ignore all the others.

You can also mark an example or example group as `pending`. It won't run but will be printed along with the test results.<br> 
To mark something as `pending` add an `x` letter before declaration: `xdescribe`, `xcontext`, `xit`.<br>
Example can also be marked as `pending` by passing `PENDING` instead of spec block: 
```swift
it("is pending", PENDING)
```

## Expectations

Sleipnir supports defining expectations using `expect(someValue/expession).to(SomeMatcher)` syntax.
```swift
expect(true).to(beTrue())
```
`expect` method supports passing values or a block of code in a closure:
```swift
expect {
    var x = 1
    x++
    return x
}.to(equal(2))
```
We are also [working](https://github.com/railsware/Sleipnir/pull/5) on `should` syntax support. This syntax provides `should` and `shouldNot` methods to define expectations on any object:
```swift
actual.should(equal(expected))
[1, 2, 3].shouldNot(contain(4))
```

## Available matchers

#### Equal
Values must be [`Equatable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Equatable.html), [`Comparable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Comparable.html) or derive from `NSObject`.
```swift
expect([1,2,3]).to(equal(1,2,3))
expect("some string").toNot(equal("another string"))
```

#### BeNil
```swift
expect(nil).to(beNil())
expect("some string").toNot(beNil())
```

#### BeTrue/BeFalse
```swift
expect(true).to(beTrue())
expect(false).to(beFalse())
```

#### BeGreaterThan/BeLessThan
Values must be [`Comparable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Comparable.html).
```swift
expect(3).to(beGreaterThan(1))
expect(1).to(beLessThan(3))
```

#### Collections/String matchers
Sleipnir supports some matchers on collections and strings:

#### Contain
Matches if all items are in the container. Supports Swift collections with [`Equatable`](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/Equatable.html) elements, `NSArrays`, `NSSets` and `Strings`.
```swift
expect([1,2,3]).to(contain(1,3))
expect("some string").toNot(contain("another"))
```

#### BeginWith/EndWith
Matches if the container begins/ends with the specified element. Supports Swift collections with `Equatable` elements, `NSArrays` and `Strings`.
```swift
expect([1,2,3]).to(beginWith(1))
expect("some string").to(endWith("string"))
```

#### BeEmpty
Matches if a container is empty.
```swift
expect("").to(beEmpty())
expect([1,2,3]).toNot(beEmpty())
```

## TODO

- [ ] Ease of distribution (CocoaPods probably)
- [ ] XCode templates
- [ ] Shared examples support
- [ ] ```should``` syntax support (In progress, see the corresponding [Pull request](https://github.com/railsware/Sleipnir/pull/5))
- [ ] asynchronous matchers (```will```, ```willNot```, ```after```)

## Contributing

Please read the [Contributor Guide](https://github.com/railsware/Sleipnir/blob/master/CONTRIBUTING.md).

## License

Licensed under MIT license. See the [LICENSE](https://github.com/railsware/Sleipnir/blob/master/LICENSE) file for details.
