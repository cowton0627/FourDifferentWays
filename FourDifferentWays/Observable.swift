//
//  Observable.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/17.
//

import Foundation

/// ???
class Observable<T> {
    typealias Listener = ((T) -> Void)
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    private var listener: Listener?
    
    init(value: T) {
        self.value = value
    }
    
    func addObserver(rightOn: Bool = true, listener: Listener?) {
        self.listener = listener
        if rightOn {
            listener?(value)
        }
    }
    
    func removeObserver() {
        listener = nil
    }
    
    
    
}
