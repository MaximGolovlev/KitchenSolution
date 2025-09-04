//
//  RecipeCard.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topTrailing) {
                Image(recipe.imageName ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                  //  .fill(Color.gray.opacity(0.2))
                
                Button(action: {
                    recipeVM.toggleFavorite(for: recipe)
                }) {
                    Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(recipe.isFavorite ? .red : .white)
                        .padding(8)
                        .background(Color.black.opacity(0.4))
                        .clipShape(Circle())
                }
                .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(recipe.title)
                    .font(.headline)
                    .foregroundColor(.textPrimary)
                
                Text(recipe.description)
                    .font(.subheadline)
                    .foregroundColor(.textSecondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Label("\(recipe.cookingTime) min", systemImage: "clock")
                    Spacer()
                    Text(recipe.difficulty.rawValue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.accentColor.opacity(0.2))
                        .cornerRadius(8)
                }
                .font(.caption)
                .foregroundColor(.textSecondary)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color.cardBackground)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
