//
//  FavoritesView.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    if recipeVM.favoriteRecipes.isEmpty {
                        VStack(spacing: 20) {
                            Image(systemName: "heart.slash")
                                .font(.system(size: 50))
                                .foregroundColor(.textSecondary)
                            Text("No favorites yet")
                                .font(.title2)
                                .foregroundColor(.textSecondary)
                            Text("Tap the heart icon to save recipes")
                                .foregroundColor(.textSecondary)
                        }
                        .padding(.top, 100)
                    } else {
                        ForEach(recipeVM.favoriteRecipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeCard(recipe: recipe)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
            .background(Color.background)
        }
    }
}