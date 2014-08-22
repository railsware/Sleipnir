import Sleipnir

class ExampleSpec: SleipnirSpec 
{

    let spec : () = describe("Example") {
        it("expect to work") {
            expect(true).to(beTrue())
        }
        
        it("should work") {
            true.shouldNot.beFalse()
        }
    }

}

