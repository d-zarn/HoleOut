/**
 Displays course details. Includes to, and front / back 9 par, tee total yardages, address
 Used in the CourseDetailSheet
 */

import SwiftUI

struct CourseOverviewCard: View {
    
    private let course: Course
    private let logger = Logger(origin: "CourseDetailView")
    
    init(for course: Course) {
        self.course = course
    }
    
    var body: some View {
        GroupBox {
            headerSection
        }
        .padding(.horizontal)
    }
    
    // MARK: - Components
    
    /// Displays address and yardages
    private var headerSection: some View {
        VStack {
            
            /// Course address
            HStack {
                courseHeader
                Spacer()
            }
            
            Divider()
            
            /// Pars and yardages
            HStack {
                statLine
                Spacer()
                YardageMarkers(b: course.blues, w: course.whites, r: course.reds, markerLeft: false)
            }
        }
    }
    
    /// Course info
    private var courseHeader: some View {
        VStack(alignment: .leading) {
            Text("Course Overview")
                .font(.headline)
                .fontWeight(.bold)
            
            Label(course.address, systemImage: "location.fill")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    /// Par breakdowns
    private var statLine: some View {
            VStack(alignment: .leading) {
                StatItem(label: "Front", value: course.frontPar)
                StatItem(label: "Back", value: course.backPar)
                StatItem(label: "Total", value: course.par)
            }
    }
}

#Preview {
    CourseOverviewCard(for: MockData.previewCourse)
}
