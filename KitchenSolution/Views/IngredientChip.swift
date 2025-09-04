//
//  IngredientChip.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct IngredientChip: View {
    let ingredient: Ingredient
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text(ingredient.emoji)
                .font(.system(size: 30))
            
            Text(ingredient.name)
                .font(.caption)
                .foregroundColor(.textPrimary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(isSelected ? Color.accentColor : Color.cardBackground)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(isSelected ? Color.accentColor : Color.gray.opacity(0.3), lineWidth: 1)
        )
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
    }
}