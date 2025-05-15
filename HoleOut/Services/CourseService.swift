//
//  CourseService.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2025-05-14.
//

import Foundation
import SwiftUI

class CourseService: ObservableObject {
    // MARK: - Properties
    
    private let repository: CourseRepository
    
    private let logger = Logger(origin: "CourseService")
    
    // Mark: - Initialization
    
    init(repository: CourseRepository = CourseRepository.shared) {
        self.repository = repository
        logger.log("CourseService initialized")
    }
    
    // MARK: - Access Methods
    
    /// Returns all avaliable courses
    /// - Returns: Array of all courses
    func getAllCourses() -> [Course] {
        logger.log("Getting all courses")
        return repository.getAllCourses()
    }
    
    /// Finds a course by its ID
    /// - Parameter id: The UUID of the course to return
    /// - Returns: The matching course, nil if not found
    func getCourse(byID id: UUID) -> Course? {
        logger.log("Looking up course by ID: \(id)")
        return repository.getCourse(byId: id)
    }
    
    /// Finds a course by its name
    /// - Parameter name: The name of the course to return
    /// - Returns: The matching course, nil if not found
    func getCourse(byName name: String) -> Course? {
        logger.log("Looking up course by name: \(name)")
        return repository.getCourse(byName: name)
    }
    
    /// Returns a default course to use as a fallback
    /// - Returns: The first course from the repository
    func getDefaultCourse() -> Course {
        logger.log("Getting default course", level: .info)
        return repository.getAllCourses()[0]
    }
    
    // MARK: - Search Functionality
    
    /// Filters courses based on a search term
    /// - Parameter searchText: The text to search for
    /// - Returns: Array of courses matching the search by name or address
    func searchCourses(searchText: String) -> [Course] {
        guard !searchText.isEmpty else {
            return getAllCourses()
        }
        
        logger.log("Searching courses with term: \(searchText)")
        return getAllCourses().filter { course in
            course.name.localizedCaseInsensitiveContains(searchText) ||
            course.address.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    // MARK: - Round-Course Methods
    
    /// Resolves the course for a given round, using ID or name
    /// - Parameter round: The round to find the course for
    /// - Returns: The course associated with the round
    func getCourseForRound(_ round: Round) -> Course {
        // first try by ID
        if let course = getCourse(byID: round.courseId) {
            logger.log("Found course by ID for round")
            return course
        }
        
        if let course = getCourse(byName: round.courseName) {
            // update the rounds course ID if ID search failed
            round.courseId = course.id
            logger.log("Found course by Name for round, updated ID")
            return course
        }
        
        logger.log("Failed to find course with ID \(round.courseId) or name \(round.courseName). Returning default.", level: .error)
        
        let defaultCourse = getDefaultCourse()
        round.courseId = defaultCourse.id
        round.courseName = defaultCourse.name
        
        return defaultCourse
    }
    
    /// Gets rounds plated at a specific course
    /// - Parameters:
    ///   - course: The course to filter by
    ///   - rounds: Array of all rounds to filter
    /// - Returns: Array of rounds played at given course
    func getRoundsForCourse(_ course: Course, from rounds: [Round]) -> [Round] {
        logger.log("Filtering rounds from course: \(course.name)")
        return rounds.filter { $0.courseId == course.id }
            .sorted { $0.date > $1.date }
    }
}
