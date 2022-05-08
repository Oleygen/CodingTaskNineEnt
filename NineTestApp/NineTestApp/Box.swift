//
//  Box.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import Foundation

// The box class purpose is to provide reactive binding behaviour

class Box<T> {
    typealias Listener = (T?) -> (Void)
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    var listener: Listener?
    
    init(value: T?) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(self.value)
    }
}
