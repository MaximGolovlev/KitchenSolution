//
//  RecipeDetailView.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @EnvironmentObject var recipeVM: RecipeViewModel
    @State private var showingTimer = false
    @State private var currentStepIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                // Header Image
                ZStack(alignment: .topTrailing) {
                    Image(recipe.imageName ?? "")
                       // .fill(Color.gray.opacity(0.2))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                    
                    Button(action: {
                        recipeVM.toggleFavorite(for: recipe)
                    }) {
                        Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(recipe.isFavorite ? .red : .white)
                            .padding(12)
                            .background(Color.black.opacity(0.4))
                            .clipShape(Circle())
                    }
                    .padding(16)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    // Title and Info
                    VStack(alignment: .leading, spacing: 8) {
                        Text(recipe.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.textPrimary)
                        
                        Text(recipe.description)
                            .foregroundColor(.textSecondary)
                        
                        HStack(spacing: 20) {
                            Label("\(recipe.cookingTime) min", systemImage: "clock")
                            Label("\(recipe.calories ?? 0) cal", systemImage: "flame")
                            Text(recipe.difficulty.rawValue)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.accentColor.opacity(0.2))
                                .cornerRadius(8)
                        }
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                    }
                    
                    // Ingredients
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ingredients")
                            .font(.headline)
                            .foregroundColor(.textPrimary)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                            ForEach(recipe.ingredients) { ingredient in
                                HStack {
                                    Text(ingredient.emoji)
                                    Text(ingredient.name)
                                        .font(.caption)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.7)
                                }
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(Color.cardBackground)
                                .cornerRadius(8)
                            }
                        }
                    }
                    
                    // Steps
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Cooking Steps")
                            .font(.headline)
                            .foregroundColor(.textPrimary)
                        
                        ForEach(Array(recipe.steps.enumerated()), id: \.element.id) { index, step in
                            StepRow(step: step, stepNumber: index + 1)
                        }
                    }
                    
                    // Start Cooking Button
                    Button(action: {
                        showingTimer = true
                        currentStepIndex = 0
                    }) {
                        Text("Start Cooking")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingTimer) {
            TimerSheet(recipe: recipe, currentStepIndex: $currentStepIndex)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StepRow: View {
    let step: RecipeStep
    let stepNumber: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(stepNumber)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(Circle().fill(Color.accentColor))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(step.description)
                    .foregroundColor(.textPrimary)
                
                if let duration = step.duration {
                    Text("\(duration / 60) min \(duration % 60) sec")
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(12)
    }
}
