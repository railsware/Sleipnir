//
//  FirstSpec.swift
//  Sleipnir
//
//  Created by AlexDenisov on 6/16/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Sleipnir

class LibrarySpec : SleipnirSpec {
    
    var nonNilObject : () = sharedExamplesFor("a non-nil object") { (sharedContext : SharedContext) in
        
        var object: AnyObject?
        beforeEach {
            object = sharedContext()["object"]
        }
        
        it("should not be nil") {
            expect(object).toNot(beNil());
        }
    }
    
    var book : () = context("Book") {
        
        var swiftBook: Book! = nil
        beforeAll {
            swiftBook = Book(title: "Introduction to Swift", author: "Apple Inc.")
        }
        
        itShouldBehaveLike("a non-nil object", sharedContext: { ["object" : swiftBook] })
        
        it("has title") {
            expect(swiftBook!.title).to(equal("Introduction to Swift"))
        }
       
        it("has author") {
            swiftBook!.author.should.equal("Apple Inc.")
        }
    }
    
    var library : () = context("Library") {
        
        var swiftLibrary: Library! = nil
        beforeAll {
            swiftLibrary = Library()
        }
        
        afterAll {
            swiftLibrary = nil
        }
        
        itShouldBehaveLike("a non-nil object", sharedContext: { ["object" : swiftLibrary] })
        
        describe("empty") {
            it("has no books") {
                expect(swiftLibrary!.hasBooks()).to(beFalse())
            }
        }
        
        describe("with books") {
            
            beforeEach {
                swiftLibrary!.addBook(Book(title: "Introduction to Swift", author: "Apple Inc."))
                swiftLibrary!.addBook(Book(title: "Using Swift with Cocoa", author: "Apple Inc."))
                swiftLibrary!.addBook(Book(title: "Swift tutorials", author: "John Doe"))
                swiftLibrary!.addBook(Book(title: "Programming iOS with Swift", author: "Vladimir Swiftin"))
            }
            
            afterEach {
                swiftLibrary!.clear()
            }
            
            it("is not empty") {
                swiftLibrary!.hasBooks().should.beTrue()
            }
            
            it("has correct number of books") {
                expect(swiftLibrary!.size()).to(equal(4))
                swiftLibrary!.removeLastBook()
                expect(swiftLibrary!.size()).to(equal(3))
            }
            
            describe("filters books") {
                it("by author") {
                    expect(swiftLibrary!.filterBy(author: "Apple Inc.").count).to(equal(2))
                }
                
                it("by title") {
                    expect(swiftLibrary!.filterBy(title: "tutorials").count).to(equal(1))
                }
            }
        }
    }

}

