//
//  LinkedListView.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 23/03/2023.
//

import SwiftUI

struct LinkedListView : View {
  @EnvironmentObject var state : StateController

    
    var body: some View {
    NavigationView {
        VStack {
            Text("The list auto-shuffles")
            List(state.linkedListBaseList) { item in
                HStack {
                    Text(String(item.id)).foregroundColor(item.color)
                    Text(item.name)
                }
            }
      }
      .navigationBarTitle(Text("Linked List"))
      .navigationBarItems(
        trailing:
            HStack {
                Button(action: addItem, label: { Text("Add") })
                Button(action: removeFirstItem, label: { Text("Remove first") })
                Button(action: removeLastItem, label: { Text("Remove last") })
            }
      )
    }
  }
    func addItem() {
        let rand = state.itemOriginals.randomElement()!
        let randomItem = Node(id: state.linkedList.internal_counter, name: rand.0, color: rand.1)
        state.linkedList.internal_counter += 1
        //itemList.insert(randomItem, at: 0)
        state.linkedList.add_node(randomItem)
        // horrible; could't figure out how to make base_list observable
        state.linkedListBaseList = state.linkedList.base_list
    
  }
    func removeFirstItem() {
        _ = state.linkedList.del_first()
        state.linkedListBaseList = state.linkedList.base_list
    }
    
    func removeLastItem() {
        _ = state.linkedList.del_last()
        state.linkedListBaseList = state.linkedList.base_list
    }
}
