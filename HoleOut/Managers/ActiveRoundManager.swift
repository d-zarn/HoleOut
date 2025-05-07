//
//  ActiveRoundManager.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2025-05-03.
//

import SwiftUI
import SwiftData
class ActiveRoundManager : ObservableObject {
    // MARK: - Properties
    
    // The active round being played
    @Published private(set) var currentRound: Round?
    @Published var scoreBindings: [Binding<Int>] = []
    
    private let logger = Logger(origin: "ActiveRoundManager")
    
    // MARK: - Round Management
    
    // Updates the score for a specified hole
    func updateScore(for holeIndex: Int, score: Int) {
        guard var round = currentRound,
              holeIndex < round.scores.count else { return }
        round.scores[holeIndex] = score
        round.playedHoles[holeIndex] = true
        round.holesPlayed = round.playedHoles.filter { $0 }.count
        
        currentRound = round
        
        logger.log("Updated score to \(score) for hole \(holeIndex)", level: .success)
    }
    
    // Starts a new round at the given course
    func startNewRound(at course: Course) {
        currentRound = Round(at: course)
        
        let holeCount = course.holes.count
        scoreBindings = Array(repeating: Binding.constant(0), count: holeCount)
        
        for i in 0..<holeCount {
            scoreBindings[i] = Binding(
                get: { [weak self] in
                    guard let self = self, let round = self.currentRound else { return 0 }
                    return round.scores[i]
                },
                set: { [weak self] newValue in
                    guard let self = self else { return }
                    self.updateScore(for: i, score: newValue)
                }
            )
            logger.log("New round started at \(course.name)", level: .info)
        }
    }
    
    
    func completeRound() -> Round? {
        guard let round = currentRound else { return nil }
        
        // set end time
        var completedRound = round
        completedRound.endTime = Date()
        
        // clear current round
        currentRound = nil
        
        logger.log("Round Completed", level: .success)
        return completedRound
    }
    
    func abandonRound() {
        currentRound = nil
        logger.log("Round abandoned", level: .info)
    }
    
    // MARK: - Bindings
    
    // creates bindings for hole scores to use in views
    
//    var scoreBindings: [Binding<Int>] {
//        guard let round = currentRound else { return [] }
//        
//        return round.scores.indices.map { index in
//            Binding(
//                get: { round.scores[index] },
//                set: { self.updateScore(for: index, score: $0) }
//            )
//        }
//    }
}

extension ActiveRoundManager {
    static var preview: ActiveRoundManager {
        let manager = ActiveRoundManager()
        manager.startNewRound(at: MockData.previewCourse)
        return manager
    }
}
