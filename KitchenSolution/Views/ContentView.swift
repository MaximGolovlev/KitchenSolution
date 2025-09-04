//
//  ContentView.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var recipeVM = RecipeViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            IngredientsSelectionView()
                .tabItem {
                    Label("Ingredients", systemImage: "refrigerator")
                }
                .tag(0)
            
            RecipesListView()
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
                .tag(1)
                .badge(recipeVM.availableRecipesCount)
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(2)
        }
        .environmentObject(recipeVM)
        .accentColor(.accentColor)
    }
}
