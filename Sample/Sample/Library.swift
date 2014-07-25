//
//  Library.swift
//  Sleipnir
//
//  Created by Artur Termenji on 7/3/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Library {
    
    var books: [Book]
    
    init() {
        self.books = [Book]()
    }
    
    func addBook(book: Book) {
        books.append(book)
    }
    
    func removeLastBook() {
        books.removeLast()
    }
    
    func clear() {
        books.removeAll()
    }
    
    func size() -> Int {
        return books.count
    }
    
    func hasBooks() -> Bool {
        return size() > 0
    }
    
    func filterBy(#author: String) -> [Book] {
        return books.filter { $0.author == author }
    }
    
    func filterBy(#title: String) -> [Book] {
        return books.filter {
            $0.title.rangeOfString(title) != nil
        }
    }
}