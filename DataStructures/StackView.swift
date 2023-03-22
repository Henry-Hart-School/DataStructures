//
//  StackView.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 23/03/2023.
//

import SwiftUI

struct StackView : View {
  @EnvironmentObject var state : StateController

    
    var body: some View {
    NavigationView {
        List(state.stackBaseList) { item in
        HStack {
            Text(String(item.id)).foregroundColor(item.color)
            Text(item.name)
        }
      }
      .navigationBarTitle(Text("Stack"))
      .navigationBarItems(
        trailing:
            HStack {
                Button(action: addItem, label: { Text("Add") })
                Button(action: removeItem, label: { Text("Remove") })
            }
      )
    }
  }
    func addItem() {
        let rand = state.itemOriginals.randomElement()!
        let randomItem = StackItem(id: state.stack.ptr+1, name: rand.0, color: rand.1)
        //itemList.insert(randomItem, at: 0)
        state.stack.push(randomItem)
        // horrible; could't figure out how to make base_list observable
        state.stackBaseList = state.stack.base_list
    
  }
    func removeItem() {
        _ = state.stack.pop()
        state.stackBaseList = state.stack.base_list
    }
}
