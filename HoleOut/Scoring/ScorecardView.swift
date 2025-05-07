//
//  ScorecardView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-23.
//

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
                    roundPersistence.saveRound(completedRound)
                }
                dismiss()
                selectedTab = 1
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
