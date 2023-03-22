//
//  StateController.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 22/03/2023.
//

import Foundation
import SwiftUI

class StateController : ObservableObject {
    
    // everything
    var itemOriginals = [
        ("Random thing 4!", Color.red),
        ("Random thing 3!", Color.blue),
        ("Random thing 2!", Color.green),
        ("Random thing 1!", Color.yellow)
    ]
    
    // Stack
    @Published var stackBaseList = [
        StackItem(id: 3, name: "Random thing 4!", color: .red),
        StackItem(id: 2, name: "Random thing 3!", color: .blue),
        StackItem(id: 1, name: "Random thing 2!", color: .green),
        StackItem(id: 0, name: "Random thing 1!", color: .yellow)
    ]
    var stack : Stack
    
    // Queue
    @Published var queueBaseList = [
        QueueItem(id: 0, name: "Random thing 4!", color: .red),
        QueueItem(id: 1, name: "Random thing 3!", color: .blue),
        QueueItem(id: 2, name: "Random thing 2!", color: .green),
        QueueItem(id: 3, name: "Random thing 1!", color: .yellow)
    ]
    var queue : Queue
    
    // LinkedList
    let linkedListBaseListOrg = [
        Node(id: 0, name: "Random thing 4!", color: .red),
        Node(id: 1, name: "Random thing 3!", color: .blue),
        Node(id: 2, name: "Random thing 2!", color: .green),
        Node(id: 3, name: "Random thing 1!", color: .yellow)
    ]
    @Published var linkedListBaseList = [
        Node(id: 0, name: "Random thing 4! ptr: 1", color: .red),
        Node(id: 1, name: "Random thing 3! ptr: 2", color: .blue),
        Node(id: 2, name: "Random thing 2! ptr: 3", color: .green),
        Node(id: 3, name: "Random thing 1! ptr: -", color: .yellow)
    ]
    var linkedList : LinkedList
    
    init () {
        stack = Stack()
        queue = Queue()
        linkedList = LinkedList()
        linkedList.base_list = linkedListBaseListOrg
        /*var tmpid = 1
        for node in linkedListBaseList {
            node.name += " ptr: "
            if tmpid < 4 {
                node.name += "\(tmpid)"
                tmpid += 1
            }
            else {
                node.name += "-"
            }
        }*/
        linkedList.internal_counter = 4
        
        queue.tail = 3
        
        stack.base_list = stackBaseList
        /*var redirectedList : [StackItem] {
            get {
                return stackBaseList
            }
            set (val) {
                stackBaseList = val
            }
        }
        stack.base_list = redirectedList*/
        queue.base_list = queueBaseList
    }
}
