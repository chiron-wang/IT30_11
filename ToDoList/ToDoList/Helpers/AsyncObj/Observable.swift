//
//  Observable.swift
//  ToDoList
//
//  Created by mikewang on 2019/11/4.
//  Copyright © 2019 mikewang. All rights reserved.
//

import Foundation

class Observable<T> {
    
    private var valueChanged: ((T) -> Void)?
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func addObserve(objWillChange: Bool = true, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if objWillChange {
            onChange?(value)
        }
    }
    
    func removeObserve() {
        valueChanged = nil
    }
}
