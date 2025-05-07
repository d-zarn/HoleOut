/**
 Main view for Scoring system. Displays each hole as a list of HoleScoringCards.
 Displays a static status bar at the top of the view to display current score for front and back nines and total.
 Status bar can be tapped to reveal save and discard buttons
 Saving round commits to history and navigates to the RoundListView
 Discarding a round deletes the round and navigates back to the CourseSelectView
 */

import SwiftUI

struct ScorecardView: View {
    
    @EnvironmentObject private var activeRoundManager: ActiveRoundManager
    @EnvironmentObject private var roundPersistence: RoundPersistenceManager
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTab: Int
    @State private var showActions = false
    
    private let logger = Logger(origin: "ScorecardView")
    
    var body: some View {
        VStack {
            fullStatusBar
            
            if let round = activeRoundManager.currentRound {
                ScrollView {
                    VStack {
                        ForEach(Array(zip(round.course.holes.sorted(by: { $0.id < $1.id }).indices,
                                          round.course.holes.sorted(by: { $0.id < $1.id }))), id: \.0) { index, hole in
                            if index < activeRoundManager.scoreBindings.count {
                                HoleScoringCard(
                                    hole: round.course.holes[index],
                                    score: activeRoundManager.scoreBindings[index]
                                )
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Components
    
    /// Uses roundStatusBar to display the cumulative scores for front and back nines and total.
    /// Can be tapped to reveal save / discard buttons
    private var fullStatusBar: some View {
        GroupBox {
            VStack {
                roundStatusBar
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            showActions.toggle()
                        }
                    }
                
                if showActions {
                    Divider()
                    actionButtons
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                showActions.toggle()
            }
        }
    }
    
    /// Displays cumulative scores for front / back and total
    private var roundStatusBar: some View {
        HStack {
            StatItem(
                label: "Total",
                value: activeRoundManager.currentRound?.totalScore ?? 0
            )
            Spacer()
            StatItem(
                label: "Front",
                value: activeRoundManager.currentRound?.frontNine ?? 0)
            Spacer()
            StatItem(
                label: "Back",
                value: activeRoundManager.currentRound?.backNine ?? 0)
        }
    }
    
    /// Buttons for save and discard
    /// Pressing save commits the round to memory and navigates tot he RoundListView
    /// Pressing discard destroys the round and dismisses back to CourseSelectView
    private var actionButtons: some View {
        HStack {
            // discard button
            Button {
                logger.log("Discard pressed")
                activeRoundManager.abandonRound()
                dismiss()
            } label: {
                Label("Discard", systemImage: "trash")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(.red).opacity(0.5))

            Button {
                logger.log("Save pressed")
                if let completedRound = activeRoundManager.completeRound() {
                    roundPersistence.saveRound(completedRound) // commit round to history
                }
                dismiss()
                selectedTab = 1 // navigate to RoundListView
            } label: {
                Label("Save", systemImage: "square.and.arrow.down")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(.green).opacity(0.5))
            
        }
        
    }
}

#Preview {
    ScorecardView(selectedTab: .constant(0))
        .environmentObject(ActiveRoundManager.preview)
}
