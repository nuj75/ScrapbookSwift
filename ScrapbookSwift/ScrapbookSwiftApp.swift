//
//  ScrapbookSwiftApp.swift
//  ScrapbookSwift
//
//  Created by a kandasamy on 2024-05-12.
//

import SwiftUI
import SwiftData

@main
struct ScrapbookSwiftApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
             NoteFile.self, Notebook.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
