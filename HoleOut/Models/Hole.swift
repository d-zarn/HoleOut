/**
 Represents a hole on a golf course.
 */

import Foundation
import SwiftData

@Model
final class Hole {
    
    var number: Int
    var tees: [Tee]
    var score: Int
    var played: Bool = false
    
    init(number: Int, tees: [Tee], score: Int) {
        self.number = number
        self.tees = tees
        self.score = score
    }
}
