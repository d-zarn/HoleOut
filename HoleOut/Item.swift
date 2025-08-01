//
//  Item.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2025-07-31.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
