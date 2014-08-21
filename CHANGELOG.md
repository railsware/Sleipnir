Change Log
==========

Version 0.4.0 *(2014-08-21)*
----------------------------

* Support for XCode6-Beta6
* New: Should syntax implementation. [Documentation](https://github.com/railsware/Sleipnir/blob/master/ShouldSyntax.md)
```swift
actual.should.equal(expected)
```
* Change: Drop support for multiple items in Contain matcher.

Version 0.3.1 *(2014-08-11)*
----------------------------

* Fix: Update for OSX and iOS frameworks. They now work in project with both Swift and ObjC code
* Fix: Return correct result after specs run.

Version 0.3.0 *(2014-08-07)*
----------------------------

* Support for XCode6-Beta5.
* Distribution as a framework through CocoaPods (experimental)
* New: shared example groups
* New: operator syntax for some matchers: `expect(3) == 3`
* New matchers:
  * BeGreaterThanOrEqualTo/BeLessThanOrEqualTo
* Fix: Shorten random seed to 4 digits

Version 0.2.0 *(2014-07-29)*
----------------------------

* Support for XCode6-Beta4.
* New: support for focused and excluded examples and example groups.
* New matchers:
  * BeNil
  * BeGreaterThan/BeLessThan
  * Matchers on containers (Contain, BeEmpty, BeginWith, EndWith)
* Support for trailing closure in `expect`

Version 0.1.0 *(2014-07-14)*
----------------------------

Initial release.
* Support for XCode6-Beta3.
* Test Slepnir with Sleipnir specs.
