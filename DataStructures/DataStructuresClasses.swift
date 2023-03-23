//
//  DataStructuresClasses.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 22/03/2023.
//

import Foundation
import SwiftUI

// extremely hacky
// id required for UI list ==> effectively 'address'
// name + color are both part of 'data' field
struct StackItem: Identifiable {
  var id: Int
  let name: String
  let color: Color
}

// this makes me very sad
// still acts as stack, but base array is reversed.
class Stack : ObservableObject {
    var ptr : Int {
        get {
            return base_list.count - 1
        }
    }
    @Published var base_list : [StackItem] = []
    
    func push(_ thing: StackItem) {
        base_list.insert(thing, at: 0)
    }
    
    func pop() -> Bool {
        if ptr >= 0 {
            base_list.removeFirst()
            return true
        }
        return false
    }
    
    // unused (the StackView makes it obvious where stuff is)
    func peek(_ loc : Int = 0) -> StackItem? {
        if loc <= base_list.endIndex {
            return base_list[loc]
        }
        else {
            return nil
        }
    }
}

struct QueueItem: Identifiable {
  var id: Int
  let name: String
  let color: Color
}

class Queue : ObservableObject {
    var head = 0
    var tail = -1
    @Published var base_list : [QueueItem] = []
    
    func push(_ thing: QueueItem) {
        base_list.append(thing)
        tail += 1
    }
    
    func pop() -> Bool {
        if tail >= head {
            base_list.removeFirst()
            if tail == head {
                head = -1
                tail = -1
            }
            head += 1
            return true
        }
        return false
    }
}

class Node: Identifiable {
    var id: Int
    var name: String
    var color: Color
    var next: Node?
    
    // bet you didn't see this coming
    init(id: Int, name: String, color: Color){
        self.id = id
        self.name = name
        self.color = color
    }
}

class LinkedList : ObservableObject {
    var root: Node?
    var internal_counter = 0
    var base_list: [Node] {
        // magic
        get {
            var tmpList : [Node] = []
            var curnode = root
            var curid = 0
            while let unwrapped = curnode {
                unwrapped.id = curid
                let tmpNode = Node(id: unwrapped.id, name: unwrapped.name, color: unwrapped.color)
                tmpNode.next = unwrapped.next
                tmpList.append(tmpNode)
                curnode = unwrapped.next
                curid += 1
            }
            for node in tmpList {
                node.name += " ptr: "
                if let pointed = node.next {
                    node.name += "\(pointed.id)"
                }
                else {
                    node.name += "-"
                }
            }
            // auto shuffle, whether you like it or not
            return tmpList.shuffled()
        }
        set {
            // well it removes the errors
            var curnode : Node = Node(id: 0, name: "", color: Color.cyan)
            if newValue.count > 0 {
                root = newValue[0]
                curnode = root!
            }
        
            // faster than repeated add_node
            for node in newValue {
                curnode.next = node
                curnode = curnode.next!
            }
        }
    }
    
    init () {
        base_list = []
    }
    
    func add_node(_ node: Node) {
        var curnode = root
        // inefficient but whatever
        while let unwrapped = curnode {
            curnode = unwrapped.next
            if unwrapped.next == nil {
                unwrapped.next = node
            }
        }
        if root == nil {
            root = node
        }
    }
    
    func del_first() -> Bool {
        if let unwrapped = root {
            root = unwrapped.next
            return true
        }
        return false
    }
    
    func del_last() -> Bool {
        var curnode = root
        if let unwrapped = curnode {
            if unwrapped.next == nil {
                root = nil
                return true
            }
        }
        while let unwrapped = curnode {
            if let nextnext = unwrapped.next {
                if nextnext.next == nil {
                    unwrapped.next = nil
                    return true
                }
            }
            curnode = unwrapped.next
            //return true
        }
        return false
    }
}
