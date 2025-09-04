//
//  RecipesListView.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    if recipeVM.filteredRecipes.isEmpty {
                        VStack(spacing: 20) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 50))
                                .foregroundColor(.textSecondary)
                            Text("No recipes found")
                                .font(.title2)
                                .foregroundColor(.textSecondary)
                            Text("Try selecting different ingredients")
                                .foregroundColor(.textSecondary)
                        }
                        .padding(.top, 100)
                    } else {
                        ForEach(recipeVM.filteredRecipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeCard(recipe: recipe)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Available Recipes")
            .background(Color.background)
        }
    }
}