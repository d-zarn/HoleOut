/**
 Handles round persistence operations for saving and deleting rounds
 */

import SwiftUI
import SwiftData

class RoundPersistenceManager: ObservableObject {
    // MARK: - Properties
    
    private let modelContext: ModelContext
    private let logger = Logger(origin: "RoundPersistenceManager")
    
    // MARK: - Initialization
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - Data Operations
    
    /// Save to database
    func saveRound(_ round: Round) {
        modelContext.insert(round)
        do {
            try modelContext.save()
            logger.log("Round Saved Successfully", level: .success)
        } catch {
            logger.log("Error saving round: \(error.localizedDescription)", level: .error)
        }
    }
    
    /// deletes a round from the database
    func deleteRound(_ round: Round) {
        modelContext.delete(round)
        do {
            try modelContext.save()
            logger.log("Round deleted Successfully", level: .success)
        } catch {
            logger.log("Error deleting round: \(error.localizedDescription)", level: .error)
        }
    }
    
    // MARK: - Complete and Save
    
    /// Takes a completedRound from ActiveRoundManager and saves it
    func completeAndSaveRound(_ round: Round) {
        saveRound(round)
        logger.log("Round completed and saved", level: .success)
    }
    
}

// MARK: - Preview Helper
@MainActor
extension RoundPersistenceManager {
    static var preview: RoundPersistenceManager {
        let modelContainer = try! ModelContainer(for: Round.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        return RoundPersistenceManager(modelContext: modelContainer.mainContext)
    }
}
