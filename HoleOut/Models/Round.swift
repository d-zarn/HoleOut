/**
 Only model needed to be saved.
 Created when 'Start Round' button is pressed on the CourseCard,
 Saved or discarded with buttons in ScorecardView
 */

import Foundation
import SwiftData

@Model
final class Round {
    
    // MARK: - Default properties
    var id: UUID
    var date: Date
    var holesPlayed: Int
    var startTime: Date?
    var endTime: Date?
    var courseId: UUID
    var courseName: String
    var scores: [Int]
    var playedHoles: [Bool]
    
    init(at course: Course) {
        self.id = UUID()
        self.courseId = course.id
        self.courseName = course.name
        self.date = Date()
        self.scores = course.holes.map { $0.par }
        self.playedHoles = Array(repeating: false, count: course.holes.count)
        self.holesPlayed = 0
        self.startTime = Date()
    }
    
    // MARK: - Computed properties
    
    /// Checks if all 18 holes were played
    var isComplete: Bool {
        holesPlayed == playedHoles.count
    }
    
    /// checks if at least 1 hole and less than 18 were played
    var isPartial: Bool {
        holesPlayed > 0 && !isComplete
    }
    
    /// computes the length of the round, converts to minutes
    private var duration: TimeInterval? {
        startTime.map { (endTime ?? Date()).timeIntervalSince($0) }
    }
    
    /// converts the duration to a string format
    var roundDuration: String? {
        duration.map { duration in
            let hours = Int(duration) / 3600
            let minutes = Int(duration) / 60 % 60
            return hours > 0 ? "\(hours)h \(minutes)m" : "\(minutes)m"}
    }
    
    /// converts the date to a string format
    var dateString: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
}
