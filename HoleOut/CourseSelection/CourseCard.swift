/**
 Displays Course name and address and contains buttons for displaying the CourseDetailSheet and starting a new round.
 Starting a new round generates a new round and navigates to the ScorecardView for that course.
 */

import SwiftUI

struct CourseCard: View {
    
    @State private var showingCourseDetail = false
    @State private var showingScorecardView = false
    @EnvironmentObject private var activeRoundManager: ActiveRoundManager
    @EnvironmentObject private var courseService: CourseService
    @Binding var selectedTab: Int
    private let course: Course
    private let logger: Logger
    
    init(for course: Course, selectedTab: Binding<Int>) {
        self.course = course
        self._selectedTab = selectedTab
        self.logger = Logger(origin: "CourseCard: \(course.name)")
    }
    
    var body: some View {
        GroupBox {
            courseDetails
            Divider()
            buttonSet
        }
        .padding(.horizontal)
        .sheet(isPresented: $showingCourseDetail) {
            CourseDetailSheet(for: course)
        }
        .navigationDestination(isPresented: $showingScorecardView) {
            ScorecardView(selectedTab: $selectedTab)
        }
        .onAppear {
            logger.log("loaded")
        }
    }
    
    
    // MARK: - Components
    
    /// Displays name, address, and par
    private var courseDetails: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(course.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.5)
                Label(course.address, systemImage: "location.fill")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .minimumScaleFactor(0.5)
            }
            Spacer()
        }
    }
    
    
    /// Groups both buttons
    private var buttonSet: some View {
        HStack {
            previewCourseButton
                .frame(maxWidth: .infinity)
            startRoundButton
                .frame(maxWidth: .infinity)
        }
        .frame(maxHeight: 50)
    }
    
    /// Shows the CourseDetailSheet
    private var previewCourseButton: some View {
        Button {
            showingCourseDetail = true
            logger.log("Detail Pressed")
        } label: {
            Label("Details", systemImage: "info.circle")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
        }
        .buttonStyle(.borderedProminent)
    }
    
    /// Shows the ScorecardView on tap
    private var startRoundButton: some View {
        Button {
            logger.log("Start Round Pressed")
            activeRoundManager.startNewRound(at: course)
            showingScorecardView = true
        } label: {
            Label("Start Round", systemImage: "figure.golf")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CourseCard(for: MockData.previewCourse, selectedTab: .constant(0))
        .modelContainer(for: Round.self, inMemory: true)
}
