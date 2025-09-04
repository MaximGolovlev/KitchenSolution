//
//  TimerSheet.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct TimerSheet: View {
    let recipe: Recipe
    @Binding var currentStepIndex: Int
    @State private var timeRemaining: Int = 0
    @State private var timer: Timer? = nil
    @State private var isPlaying = false
    @Environment(\.dismiss) private var dismiss
    
    private var currentStep: RecipeStep? {
        guard currentStepIndex < recipe.steps.count else { return nil }
        return recipe.steps[currentStepIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                if let step = currentStep {
                    // Progress
                    VStack(spacing: 8) {
                        Text("Step \(currentStepIndex + 1) of \(recipe.steps.count)")
                            .font(.caption)
                            .foregroundColor(.textSecondary)
                        
                        ProgressView(value: Double(currentStepIndex + 1), total: Double(recipe.steps.count))
                            .progressViewStyle(LinearProgressViewStyle())
                    }
                    .padding(.horizontal)
                    
                    // Timer Display
                    VStack(spacing: 20) {
                        if let duration = step.duration, duration > 0 {
                            Text(timeString(timeRemaining))
                                .font(.system(size: 48, weight: .bold, design: .monospaced))
                                .foregroundColor(.accentColor)
                        }
                        
                        Text(step.description)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    // Controls
                    HStack(spacing: 30) {
                        if let duration = step.duration, duration > 0 {
                            
                            if isPlaying {
                                Button(action: {
                                    stopTimer()
                                }) {
                                    Image(systemName: "stop.fill")
                                        .padding()
                                        .background(Circle().fill(Color.gray))
                                        .foregroundColor(.white)
                                }
                            } else {
                                Button(action: {
                                    startTimer(for: duration)
                                }) {
                                    Image(systemName: "play.fill")
                                        .padding()
                                        .background(Circle().fill(Color.accentColor))
                                        .foregroundColor(.white)
                                }
                            }

                        }
                    }
                    
                    Spacer()
                    
                    // Navigation
                    HStack {
                        if currentStepIndex > 0 {
                            Button("Previous Step") {
                                goToPreviousStep()
                            }
                        }
                        
                        Spacer()
                        
                        Button(currentStepIndex == recipe.steps.count - 1 ? "Finish" : "Next Step") {
                            goToNextStep()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                        
                        Text("Cooking Complete!")
                            .font(.title2)
                        
                        Text("Enjoy your meal!")
                            .foregroundColor(.textSecondary)
                        
                        Button("Done") {
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .padding()
            .navigationTitle("Cooking Mode")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        stopTimer()
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let firstStep = currentStep, let duration = firstStep.duration {
                    timeRemaining = duration
                }
            }
            .onDisappear {
                stopTimer()
            }
        }
    }
    
    private func startTimer(for duration: Int) {
        stopTimer()
        timeRemaining = duration
        isPlaying = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isPlaying = false
    }
    
    private func goToNextStep() {
        stopTimer()
        if currentStepIndex < recipe.steps.count - 1 {
            currentStepIndex += 1
            if let duration = currentStep?.duration {
                timeRemaining = duration
            }
        } else {
            dismiss()
        }
    }
    
    private func goToPreviousStep() {
        stopTimer()
        if currentStepIndex > 0 {
            currentStepIndex -= 1
            if let duration = currentStep?.duration {
                timeRemaining = duration
            }
        }
    }
    
    private func timeString(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
