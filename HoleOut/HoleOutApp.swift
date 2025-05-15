//
//  HoleOutApp.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import SwiftUI
import SwiftData

@main
struct HoleOutApp: App {
    
    @StateObject private var activeRoundManager = ActiveRoundManager()
    @StateObject private var roundPersistence: RoundPersistenceManager
    @StateObject private var courseService = CourseService()
    @State private var selectedTab = 0
    let sharedModelContainer: ModelContainer
    
    init() {
        let schema = Schema([
            Round.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.sharedModelContainer = container
            _roundPersistence = StateObject(wrappedValue: RoundPersistenceManager(modelContext: container.mainContext))
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab){
                CourseSelectView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Courses", systemImage: "house.and.flag.circle.fill")
                    }
                    .tag(0)
                
                RoundListView()
                    .tabItem {
                        Label("History", systemImage: "flag.pattern.checkered")
                    }
                    .tag(1)
            }
            .modelContainer(sharedModelContainer)
            .environmentObject(activeRoundManager)
            .environmentObject(roundPersistence)
            .environmentObject(courseService)
        }
    }
}
