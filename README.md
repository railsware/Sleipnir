# Sleipnir

Sleipnir is a BDD-style framework for Swift. 
Also [Sleipnir](http://en.wikipedia.org/wiki/Sleipnir) is Odin's steed, the child of Loki and Svaðilfari, described as the best of all horses, and is sometimes ridden to the location of Hel.

Highly inspired by [Cedar](https://github.com/pivotal/cedar).
  
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

## Quick start

* TODO Importing guide
* Add new targets to your project for specs
* In ```main.swift``` file of spec target run ```Runner.run()``` to invoke specs
* Start writing specs!

## Usage sample

See [LibrarySpec](https://github.com/railsware/Sleipnir/blob/master/OSXSpecs/LibrarySpec.swift) file in [OSXSpecs](https://github.com/railsware/Sleipnir/blob/master/OSXSpecs) target.

## Documentation

Wiki coming soon...

## Contributing

Please read the [Contributor Guide](https://github.com/railsware/Sleipnir/blob/master/CONTRIBUTING.md).

## License

Licensed under MIT license. See the [LICENSE](https://github.com/railsware/Sleipnir/blob/master/LICENSE) file for details.
