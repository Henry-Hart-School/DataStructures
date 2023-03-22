//
//  DataStructuresTests.swift
//  DataStructuresTests
//
//  Created by Hart, Henry (AGDF) on 21/03/2023.
//

import XCTest
@testable import DataStructures

class DataStructuresTests: XCTestCase {

    func testStack() {
        // pop returns true if it popped an item
        // you could get this first using base_list
        let a = Stack()
        for _ in 0...10 {
            a.push(StackItem(id:0, name:"", color:.red))
        }
        for _ in 0...10 {
            XCTAssertTrue(a.pop())
        }
        XCTAssertTrue(!a.pop())
    }
    
    func testQueue() {
        // pop ^^^
        let a = Queue()
        for _ in 0...10 {
            a.push(QueueItem(id:0, name:"", color:.red))
        }
        for _ in 0...10 {
            XCTAssertTrue(a.tail >= a.head)
            XCTAssertTrue(a.pop())
        }
        XCTAssertTrue(a.head > a.tail)
        XCTAssertTrue(!a.pop())
    }
    
    func testLinkedList() {
        // del ==> pop ^^^
        // not testing UI magic like base_list, just boring old basic functionality
        // we can also technically abstract away any |next|s since all we're really doing ...
        // ... is pretending to be a continuous list
        let a = LinkedList()
        for _ in 0...10 {
            a.add_node(Node(id:0, name:"", color:.red))
        }
        for _ in 0...5 {
            XCTAssertTrue(a.del_first())
        }
        for _ in 0...4 {
            XCTAssertTrue(a.del_last())
        }
        XCTAssertTrue(!a.del_first())
        XCTAssertTrue(!a.del_last())
    }

}
