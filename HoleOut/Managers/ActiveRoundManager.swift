/**
 Handles active round interaction operations.
 Provides bindings for scoring holes, and functions for saving and abandoning rounds.
 */

import SwiftUI
import SwiftData
class ActiveRoundManager : ObservableObject {
    // MARK: - Properties
    
    /// The active round being played
    @Published private(set) var currentRound: Round?
    @Published var scoreBindings: [Binding<Int>] = []
    
    private let logger = Logger(origin: "ActiveRoundManager")
    
    // MARK: - Round Management
    
    /// Updates the score for the specified hole
    func updateScore(for holeIndex: Int, score: Int) {
        guard let round = currentRound,
              holeIndex < round.scores.count else { return }
        round.scores[holeIndex] = score
        round.playedHoles[holeIndex] = true
        round.holesPlayed = round.playedHoles.filter { $0 }.count
        
        currentRound = round
        
        logger.log("Updated score to \(score) for hole \(holeIndex)", level: .success)
    }
    
    /// Starts a new round at the given course, sets the bindings appropriately
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
    
    /// sets the end time for the round, nulls the current and returns the completed round
    func completeRound() -> Round? {
        guard let round = currentRound else { return nil }
        
        // set end time
        let completedRound = round
        completedRound.endTime = Date()
        
        // clear current round
        currentRound = nil
        
        logger.log("Round Completed", level: .success)
        return completedRound
    }
    
    /// nulls the current round
    func abandonRound() {
        currentRound = nil
        logger.log("Round abandoned", level: .info)
    }
}

extension ActiveRoundManager {
    static var preview: ActiveRoundManager {
        let manager = ActiveRoundManager()
        manager.startNewRound(at: MockData.previewCourse)
        return manager
    }
}
