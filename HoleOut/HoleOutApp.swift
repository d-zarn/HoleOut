//
//  HoleOutApp.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2025-07-31.
//

import SwiftUI
import SwiftData

@main
struct HoleOutApp: App {
    
    @State private var selectedTab = 0
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            TabView(selection: $selectedTab) {
                CourseSelectionView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Courses", systemImage: "house.and.flag")
                    }
            }
            .tint(Color("prim-green"))
        }
        .modelContainer(sharedModelContainer)
    }
}
