//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Omar Elgamal on 24/11/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ToDoList.self])
        }
    }
}
