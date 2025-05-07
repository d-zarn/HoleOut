/**
 Only model needed to be saved. Created when 'Start Round' button is pressed on the CourseCard, Saved or discarded with buttons in ScorecardView
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
    
    var course: Course {
            // First try to pull by ID
            if let course = CourseRepository.shared.getCourse(byId: courseId) {
                return course
            }
            
            // If ID lookup fails, try by name
            if let course = CourseRepository.shared.getCourse(byName: courseName) {
                // Update the ID for future reference
                courseId = course.id
                return course
            }
            
            // Log error and return a default course (first course, St. Boniface) as last resort
            let logger = Logger(origin: "Round")
            logger.log("Failed to find course with ID \(courseId) or name \(courseName)", level: .error)
            
            let defaultCourse = CourseRepository.shared.getAllCourses()[0]
            courseId = defaultCourse.id
            courseName = defaultCourse.name
            
            return defaultCourse
        }
    
    

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
    
    /// computes total score for holes played
    var totalScore: Int {
        zip(scores, playedHoles)
            .filter {_, played in played}
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    /// computes the par for the holes played
    var parForPlayedHoles: Int {
        let total = zip(course.holes, playedHoles)
            .filter {_, played in played }
            .map { hole, _ in
                print("Counting par \(hole.par) for hole \(hole.id)")
                return hole.par
            }
            .reduce(0,+)
        print("Total par for played holes: \(total)")
            return total
    }
    
    /// computes score on the front nine
    var frontNine: Int {
        zip(scores.prefix(9), playedHoles.prefix(9))
            .filter { _, played in played }
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    /// computes score on the back nine
    var backNine: Int {
        zip(scores.suffix(9), playedHoles.suffix(9))
            .filter { _, played in played }
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    /// Checks if all 18 holes were played
    var isComplete: Bool {
        holesPlayed == course.holes.count
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
