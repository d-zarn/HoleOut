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
    
    
    
}
