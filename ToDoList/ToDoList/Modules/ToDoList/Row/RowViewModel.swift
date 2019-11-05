//
//  RowViewModel.swift
//  ToDoList
//
//  Created by mikewang on 2019/11/5.
//  Copyright © 2019 mikewang. All rights reserved.
//

import Foundation

protocol RowViewModel { }

protocol RowViewModelPressible {
    var CellPressed: (() -> Void)? { get set }
}
