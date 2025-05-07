/**
 Represents the hole. Each hole gets an integer ID to indicate its order, a par, yardages, and a type
 */

import Foundation
import SwiftData

/// type indicate direction of the hole
enum HoleType: String, Codable {
    case straight = "arrowshape.up.fill"
    case dogLeft = "arrowshape.turn.up.left.fill"
    case dogRight = "arrowshape.turn.up.right.fill"
}


final class Hole: Identifiable {
    
    var id: Int
    var par: Int
    var blues: Int
    var whites: Int
    var reds: Int
    var holeType: HoleType
    
    init(id: Int, par: Int, blues: Int, whites: Int, reds: Int, holeType: HoleType = .straight) {
        self.id = id
        self.par = par
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.holeType = holeType
    }
}
