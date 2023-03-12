//
//  HoneyTaskApp.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI

@main
struct HoneyTaskApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var taskViewModel : TaskViewModel = .init()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(taskViewModel)
        }
    }
}
