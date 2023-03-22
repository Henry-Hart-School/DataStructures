//
//  QueueView.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 23/03/2023.
//

import SwiftUI

struct QueueView : View {
  @EnvironmentObject var state : StateController

    
    var body: some View {
    NavigationView {
        List(state.queueBaseList) { item in
        HStack {
            Text(String(item.id)).foregroundColor(item.color)
            Text(item.name)
        }
      }
      .navigationBarTitle(Text("Queue"))
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
        let randomItem = QueueItem(id: state.queue.tail+1, name: rand.0, color: rand.1)
        //itemList.insert(randomItem, at: 0)
        state.queue.push(randomItem)
        // horrible; could't figure out how to make base_list observable
        state.queueBaseList = state.queue.base_list
    
  }
    func removeItem() {
        _ = state.queue.pop()
        state.queueBaseList = state.queue.base_list
    }
}
