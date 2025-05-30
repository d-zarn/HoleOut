/**
 Opening view.
 Displays the list of avaliable courses as CourseCards.
 Can be searched by address or course name. Acts as a constant bottom tab.
 */

import SwiftUI

struct CourseSelectView: View {
    
    @Binding var selectedTab: Int
    @State private var searchText = ""
    private let logger = Logger(origin: "CourseSelectView")
    
    /// Allow search by name or address.
    /// Contains all courses if no search is entered.
    private var searchResults: [Course] {
        if searchText.isEmpty {
            return CourseRepository.shared.getAllCourses()
        }
        return CourseRepository.shared.getAllCourses().filter { course in
            course.name.localizedCaseInsensitiveContains(searchText) ||
            course.address.localizedCaseInsensitiveContains(searchText)
        }
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
    }

}

#Preview {
    CourseSelectView(selectedTab: .constant(0))
        .modelContainer(for: Round.self, inMemory: true)
}
