//
//  Round+Course.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2025-05-14.
//

import Foundation
import SwiftUI

extension Round {
    /// Gets the course associated with this round
    /// - Parameter courseService: The course service to use
    /// - Returns: The course for this round
    func getCourse(using courseService: CourseService) -> Course {
        return courseService.getCourseForRound(self)
    }
}
