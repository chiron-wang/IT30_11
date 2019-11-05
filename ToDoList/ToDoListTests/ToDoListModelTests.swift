//
//  ToDoListModelTests.swift
//  ToDoListTests
//
//  Created by mikewang on 2019/10/12.
//  Copyright © 2019 mikewang. All rights reserved.
//

import XCTest
@testable import ToDoList

class ToDoListModelTests: XCTestCase {
        
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToDoListStart() {
        // given
        let category = "work"
        let status = "\(Status.ongoing)"
        
        // when
        let todoList = RM_ToDoList()
        
        // then
        XCTAssertEqual(category, todoList.category)
        XCTAssertTrue(status == todoList.status)
        XCTAssertNil(todoList.endTime)
    }

}
