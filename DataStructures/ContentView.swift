//
//  ContentView.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 23/03/2023.
//

import SwiftUI

struct ContentView : View {

    var body: some View {
        NavigationView {
            VStack {
                Text("Owing to time constraints, very basic data structures. The code is horrible. Sorry.")
                List {
                    NavigationLink(destination: StackView()) {
                        Text("Stack")
                    }

                    NavigationLink(destination: QueueView()) {
                        Text("Queue")
                    }
                    
                    NavigationLink(destination: LinkedListView()) {
                        Text("Linked List")
                    }
                }
            }
        }
    }

}
