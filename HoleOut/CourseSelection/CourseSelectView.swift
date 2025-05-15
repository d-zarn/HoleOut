/**
 Opening view.
 Displays the list of avaliable courses as CourseCards.
 Can be searched by address or course name. Acts as a constant bottom tab.
 */

import SwiftUI

struct CourseSelectView: View {
    
    @EnvironmentObject private var courseService: CourseService
    @Binding var selectedTab: Int
    @State private var searchText = ""
    
    private let logger = Logger(origin: "CourseSelectView")

    private var searchResults: [Course] {
        courseService.searchCourses(searchText: searchText)
    }
    
    /// If search results are empty, shows ContentUnavailable.
    /// If no search is entered, show all courses
    var body: some View {
        NavigationStack {
            Group {
                if searchResults.isEmpty {
                    VStack {
                        Spacer()
                        ContentUnavailableView(
                            "No courses matching \(searchText)",
                            systemImage: "flag.slash",
                            description: Text("Try searching for a different course")
                        )
                        Spacer()
                    }
                } else {
                    ScrollView {
                        VStack {
                            ForEach(searchResults) { course in
                                CourseCard(for: course, selectedTab: $selectedTab)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Select Course")
            .searchable(text: $searchText, prompt: "Search courses")
        }
        .onAppear {
            logger.log("Loaded")
        }
    }

}

#Preview {
    CourseSelectView(selectedTab: .constant(0))
        .modelContainer(for: Round.self, inMemory: true)
}
