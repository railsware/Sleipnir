//
//  Observable.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/24/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class Observable<T> {
    
    typealias Observer = (newValue: T) -> ()
    
    var observers = Dictionary<String, Observer>()
    
    var observableProperty: T {
    didSet {
        notify()
    }
    }
    
    init(value: T) {
        self.observableProperty = value
    }
    
    func get() -> T {
        return observableProperty
    }
    
    func update(value: T) {
        observableProperty = value
    }
    
    func addObserver(identifier: String, observer: Observer) {
        observers[identifier] = observer
    }
    
    func removeObserver(identifer: String) {
        observers.removeValueForKey(identifer)
    }
    
    private func notify() {
        for (identifier, observer) in observers {
            observer(newValue: observableProperty)
        }
    }
}