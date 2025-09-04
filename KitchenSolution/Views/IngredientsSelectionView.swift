//
//  IngredientsSelectionView.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import SwiftUI

struct IngredientsSelectionView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    @StateObject private var ingredientsVM = IngredientsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(IngredientCategory.allCases, id: \.self) { category in
                        if let ingredients = ingredientsVM.filteredIngredientsByCategory[category] {
                            Section(header: Text(category.rawValue)
                                .font(.headline)
                                .foregroundColor(.textPrimary)
                                .padding(.horizontal)) {
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                                        ForEach(ingredients) { ingredient in
                                            IngredientChip(ingredient: ingredient, isSelected: recipeVM.selectedIngredients.contains(ingredient))
                                                .onTapGesture {
                                                    recipeVM.toggleIngredientSelection(ingredient)
                                                }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                        }
                    }
                }
                .padding(.vertical)
            }
            .searchable(text: $searchText, prompt: "Search ingredients...")
            .onChange(of: searchText) { newValue in
                ingredientsVM.searchText = newValue
            }
            .navigationTitle("What's in your fridge?")
            .background(Color.background)
        }
    }
}
