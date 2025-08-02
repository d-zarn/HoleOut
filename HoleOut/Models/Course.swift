/**
 Represents a model for a golf course
 */

import Foundation


final class Course {
    
    // MARK: - Properties
    
    var name: String
    var address: String
    var holes: [Hole]
    var tees: [Tee]
    
    init(name: String, address: String, holes: [Hole], tees: [Tee]) {
        self.name = name
        self.address = address
        self.holes = holes
        self.tees = tees
    }
    
}
