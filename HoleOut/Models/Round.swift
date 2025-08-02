//
//  Round.swift
//  HoleOut
//
//  Created by mini on 2025-08-01.
//

import Foundation
import SwiftData

@Model
final class Round {
    
    // copied from course on creation
    var coursePlayedName: String
    var teesPlayed: Tee
    var holes: [Hole]
    
    var datePlayed: Date
    var duration: TimeInterval?
    
    init(coursePlayedName: String, teesPlayed: Tee, holes: [Hole]) {
        self.coursePlayedName = coursePlayedName
        self.teesPlayed = teesPlayed
        self.holes = holes
        self.datePlayed = Date()
    }
}

