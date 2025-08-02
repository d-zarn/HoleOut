//
//  CourseSelectionViewModel.swift
//  HoleOut
//
//  Created by mini on 2025-08-01.
//

import Foundation
import SwiftUI

class CourseSelectionViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var courses: [Course] = CourseRepository.allCourses
    
    var searchResults: [Course] {
        if searchText.isEmpty {
            return courses
        } else {
            return courses.filter { course in
                course.name.localizedCaseInsensitiveContains(searchText) ||
                course.address.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    
}
