//
//  Tee.swift
//  HoleOut
//
//  Created by mini on 2025-08-01.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Tee {
    
    var colorName: String
    var yardage: Int
    var par: Int
    var rating: Double
    var slope: Int
    
    init(yardage: Int, color: String, rating: Double = 0, slope: Int = 0, par: Int) {
        self.colorName = color
        self.yardage = yardage
        self.par = par
        self.rating = rating
        self.slope = slope
    }
    
    var color: Color {
        Color(colorName)
    }
}
