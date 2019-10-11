//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by mikewang on 2019/10/11.
//  Copyright © 2019 mikewang. All rights reserved.
//

import XCTest
@testable import ToDoList

class ToDoListTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToDoListComplete() {
        // given
        let status = "\(Status.done)"
        
        // when
        let todoList = ToDoList()
        todoList.endTime = Date()
        todoList.status = "\(Status.done)"
        
        // then
        XCTAssertTrue(status == todoList.status)
        XCTAssertNotNil(todoList.endTime)
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
