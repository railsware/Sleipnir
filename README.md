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
                expect(usualHorse.legsCount).to(equal(4))
                expect(usualHorse.isAwesome()).to(beFalse())
            }
        }
        
        context("Sleipnir") {
            it("is awesome") {
                let sleipnirHorse = Sleipnir()
                expect(sleipnirHorse.legsCount).to(equal(8))
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

## Quick start

1. TODO Importing guide
2. Add new target to your project for specs
3. In ```main.swift``` file of spec target run ```Runner.run()``` to invoke specs
4. Start writing specs!

## Usage sample

See [LibrarySpec](https://github.com/railsware/Sleipnir/blob/master/Sample/LibrarySpec.swift) file in [Sample](https://github.com/railsware/Sleipnir/blob/master/Sample) target.

## TODO

- [ ] Distribution as a framework
- [ ] Pending examples support
- [ ] Focused and excluded examples/groups support implementation
- [ ] XCode templates
- [ ] Shared examples support
- [ ] ```should``` syntax support
- [ ] Specs for Sleipnir using Sleipnir
- [ ] Wiki documentation
- [ ] More matchers:
  - [ ] ```beNil```
  - [ ] ```beGreaterThan```, ```beLessThan```, ```beInRangeOf```
  - [ ] asynchronous matchers (```will```, ```willNot```, ```after```)
  - [ ] matchers on collections/strings (```contains```, ```haveCount```, ```beginWith```, ```endWith```, etc.)

## Documentation

Wiki coming soon...

## Alternatives

There are some alternative Swift BDD testing frameworks with some other concepts:
* [Quick](https://github.com/modocache/Quick)

## Contributing

Please read the [Contributor Guide](https://github.com/railsware/Sleipnir/blob/master/CONTRIBUTING.md).

## License

Licensed under MIT license. See the [LICENSE](https://github.com/railsware/Sleipnir/blob/master/LICENSE) file for details.
