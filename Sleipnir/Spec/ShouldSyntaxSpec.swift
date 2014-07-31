//
//  ShouldSyntaxSpec.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation
import Sleipnir

class ShouldSyntaxSpec : SleipnirSpec {
    
    var shouldSyntaxSpec : () = describe("Should syntax") {
        
        describe("when the values are declared as Ints") {
            describe("and the values are equal") {
                context("positive match") {
                    it("should pass") {
                        let actual = 3
                        let expected = 3
                        actual.should(equal(expected))
                    }
                }
                    
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not equal <3>"
                        expectFailureWithMessage(failureMessage) {
                            3.shouldNot(equal(3))
                        }
                    }
                }
            }

            describe("and the values are not equal") {
                context("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to equal <4>"
                        expectFailureWithMessage(failureMessage) {
                            3.should(equal(4))
                        }
                    }
                }
                    
                context("negative match") {
                    it("should pass") {
                        let actual = 3
                        let expected = 42
                        actual.shouldNot(equal(expected))
                    }
                }
            }
        }

        describe("when the values are declared as Strings") {
            describe("and the values are equal") {
                context("positive match") {
                    it("should pass") {
                        let actual = "3"
                        let expected = "3"
                        actual.should(equal(expected))
                    }
                }
                    
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to not equal <3>"
                        expectFailureWithMessage(failureMessage) {
                            "3".shouldNot(equal("3"))
                        }
                    }
                }
            }

            describe("and the values are not equal") {
                context("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3> to equal <4>"
                        expectFailureWithMessage(failureMessage) {
                            "3".should(equal("4"))
                        }
                    }
                }
                    
                context("negative match") {
                    it("should pass") {
                        let actual = "3"
                        let expected = "42"
                        actual.shouldNot(equal(expected))
                    }
                }
            }
        }

        describe("when the values are declared as Double") {
            describe("and the values are equal") {
                context("positive match") {
                    it("should pass") {
                        let actual : Double = 3.03
                        let expected : Double = 3.03
                        actual.should(equal(expected))
                    }
                }
                    
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3.03> to not equal <3.03>"
                        expectFailureWithMessage(failureMessage) {
                            3.03.shouldNot(equal(3.03))
                        }
                    }
                }
            }

            describe("and the values are not equal") {
                context("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <3.03> to equal <4.03>"
                        expectFailureWithMessage(failureMessage) {
                            3.03.should(equal(4.03))
                        }
                    }
                }
                    
                context("negative match") {
                    it("should pass") {
                        let actual : Double = 3.03
                        let expected : Double = 42.03
                        actual.shouldNot(equal(expected))
                    }
                }
            }
        }

        describe("when the values are declared as Floats") {
            describe("and the values are equal") {
                context("positive match") {
                    it("should pass") {
                        let actual : Float = 3.03
                        let expected : Float = 3.03
                        actual.should(equal(expected))
                    }
                }
            }

            describe("and the values are not equal") {
                
                context("negative match") {
                    it("should pass") {
                        let actual : Float = 3.03
                        let expected : Float = 3.04
                        actual.shouldNot(equal(expected))
                    }
                }
            }
        }

        describe("when the value is declared as Bool, which matches to BeTrue") {
            describe("and the value is true") {
                context("positive match") {
                    it("should pass") {
                        let actual = true
                        actual.should(beTrue())
                    }
                }
                    
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <true> to not evaluate to true"
                        expectFailureWithMessage(failureMessage) {
                            true.shouldNot(beTrue())
                        }
                    }
                }
            }

            describe("and the value is false") {
                context("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <false> to evaluate to true"
                        expectFailureWithMessage(failureMessage) {
                            false.should(beTrue())
                        }
                    }
                }
                    
                context("negative match") {
                    it("should pass") {
                        let actual = false
                        actual.shouldNot(beTrue())
                    }
                }
            }
        }

        describe("when the values are declared as Arrays") {
            describe("and the values are equal") {
                context("positive match") {
                    it("should pass") {
                        let actual = [1, 2, 3]
                        let expected = [1, 2, 3]
                        actual.should(equal(expected))
                    }
                }
                    
                context("negative match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3]> to not equal <[1, 2, 3]>"
                        expectFailureWithMessage(failureMessage) {
                            [1, 2, 3].shouldNot(equal([1, 2, 3]))
                        }
                    }
                }
            }

            describe("and the values are not equal") {
                context("positive match") {
                    it("should fail with a sensible failure message") {
                        let failureMessage = "Expected <[1, 2, 3]> to equal <[1, 2, 5]>"
                        expectFailureWithMessage(failureMessage) {
                            [1, 2, 3].should(equal([1, 2, 5]))
                        }
                    }
                }
                    
                context("negative match") {
                    it("should pass") {
                        let actual = [1, 2, 3]
                        let expected = [1, 2, 5]
                        actual.shouldNot(equal(expected))
                    }
                }
            }
        }

    }
    
}