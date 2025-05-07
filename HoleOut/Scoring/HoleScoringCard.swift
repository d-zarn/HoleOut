//
//  HoleScoringCard.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-23.
//

import SwiftUI

struct HoleScoringCard: View {
    @EnvironmentObject private var activeRoundManager: ActiveRoundManager
    let hole: Hole
    @Binding var score: Int
    private let logger = Logger(origin: "HoleScoringView")
    
    @State private var isLongPressing = false
    @State private var longPressProgress: CGFloat = 0.0
    @State private var showConfirmationIcon = false
    
    private var isHolePlayed: Bool {
        activeRoundManager.currentRound?.playedHoles[hole.id-1] ?? false
    }
    
    /// dims unplayed holes
    private var textColor: Color {
        if isLongPressing && longPressProgress > 0.05 {
            return longPressProgress > 0.6 ? .green :
            longPressProgress > 0.3 ? .green.opacity(0.7) :
                .secondary.opacity(0.6 + (longPressProgress * 0.6))
        } else {
            return isHolePlayed ? .primary : .secondary.opacity(0.6)
        }
    }
    
    var body: some View {
        GroupBox {
            HStack {
                holeDetails
                Spacer()
                buttonStack
                scoreIndicator
                    .contentShape(Rectangle())
                    .gesture(longPressGesture)
            }
            .frame(height: 110)
            .scaleEffect(isLongPressing ? 0.98 : 1.0)
            .animation(.spring(response: 0.3), value: isLongPressing)
            .overlay(
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.green)
                    .opacity(showConfirmationIcon ? 0.8 : 0)
                    .scaleEffect(showConfirmationIcon ? 1.0 : 0.5)
            )
        }
        .onChange(of: longPressProgress) { newValue in
                    if newValue >= 1.0 {
                        // Schedule a check after the animation completes
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            // If we're still in the pressing state but the action didn't complete,
                            // reset everything
                            if isLongPressing {
                                withAnimation(.easeOut(duration: 0.15)) {
                                    isLongPressing = false
                                    longPressProgress = 0.0
                                }
                            }
                        }
                    }
                }
    }
    
    // MARK: - Gesture
    
    private var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: 0.6, maximumDistance: 20)
                .onChanged { _ in
                    // Start the press
                    if !isHolePlayed {
                        isLongPressing = true
                        // Start progress animation
                        withAnimation(.linear(duration: 0.6)) {
                            longPressProgress = 1.0
                        }
                    }
                }
                .onEnded { _ in
                    // Only execute if hole is unplayed and we've made progress
                    if !isHolePlayed && longPressProgress > 0.7 {
                        // Trigger haptic feedback
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.success)
                        
                        // Show confirmation icon
                        withAnimation(.spring(response: 0.3)) {
                            showConfirmationIcon = true
                            // Reset to par before marking
                            score = hole.par
                            activeRoundManager.updateScore(for: hole.id - 1, score: hole.par)
                        }
                        
                        // Hide confirmation icon after delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            withAnimation {
                                showConfirmationIcon = false
                            }
                        }
                        
                        logger.log("Scored par on hole \(hole.id) using long press")
                    }
                    
                    // Reset states
                    withAnimation(.easeOut(duration: 0.2)) {
                        isLongPressing = false
                        longPressProgress = 0.0
                    }
                }
        }
    
    
    
    // MARK: - Components
    
    private var holeDetails: some View {
        HStack{
            VStack(alignment: .leading) {
                // Hole number
                Text(String(hole.id))
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .padding(.vertical, -5)
                    .foregroundStyle(textColor)
                    .animation(.easeInOut(duration: 0.15), value: isHolePlayed)
                
                // yardages
                YardageMarkers(b: hole.blues, w: hole.whites, r: hole.reds)
                    .opacity(isHolePlayed ? 1.0 : 0.6) // dim unplayed holes
                    .animation(.easeInOut(duration: 0.3), value: isHolePlayed)
            }
            Spacer()
            Image(systemName: hole.holeType.rawValue)
                .font(.largeTitle)
                .foregroundStyle(textColor)
                .animation(.easeInOut(duration: 0.3), value: isHolePlayed)
            Spacer()
        }
    }
    
    private var scoreIndicator: some View {
        
        VStack (alignment: .trailing, spacing: -10){
            Spacer()
            RelativeScore(par: hole.par, score: score)
                .font(.title)
                .frame(width: 50, alignment: .trailing)
                .contentTransition(.interpolate)
                .animation(.spring(response: 0.3), value: score)
            
            ZStack(alignment: .trailing) {
                Text(String(score))
                    .font(.system(size: 100, weight: .black))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .fixedSize(horizontal: false, vertical: true)
                    .contentTransition(.numericText())
                    .animation(.spring(response: 0.1), value: score)
                    .foregroundStyle(textColor)
                    .animation(.easeInOut(duration: 0.15), value: isHolePlayed)
            }
            .frame(width: 75, height: 100)
        }
        .frame(width: 75)
        .padding(.leading)
    }
    
    // MARK: - Buttons
    
    private var buttonStack: some View {
        VStack {
            addStroke
            Spacer()
            subtractStroke
        }
    }
    
    private var subtractStroke: some View {
        Button {
            if score > 1 {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                
                score -= 1
                withAnimation(.spring(response: 0.3)) {
                    activeRoundManager.updateScore(for: hole.id - 1, score: score)
                }
                logger.log("Decreased score on hole \(hole.id) to \(score)")
            } else {
                // Provide feedback that we can't go lower (optional)
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            
            }
        } label: {
            Label("Subtract", systemImage: "minus.circle.fill")
                .labelStyle(.iconOnly)
                .font(.system(size: 50))
        }
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(.green)
    }
    
    private var addStroke: some View {
        Button {
            if score < 15 {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
                score += 1
                withAnimation(.spring(response: 0.3)) {
                    activeRoundManager.updateScore(for: hole.id - 1, score: score)
                }
                logger.log("Increased score on hole \(hole.id) to \(score)")
            } else {
                // Provide feedback that we've reached the maximum (optional)
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            }
        } label: {
            Label("Add", systemImage: "plus.circle.fill")
                .labelStyle(.iconOnly)
                .font(.system(size: 50))
        }
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(.red)
    }
}

#Preview {
    ScrollView {
        ForEach(MockData.previewCourse.holes) { hole in
            let score = State(initialValue: hole.par)
            HoleScoringCard(hole: hole, score: score.projectedValue)
        }
    }
}
