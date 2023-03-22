//
//  DataStructuresApp.swift
//  DataStructures
//
//  Created by Hart, Henry (AGDF) on 21/03/2023.
//

import SwiftUI

@main
struct DataStructuresApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(StateController())
        }
    }
}
