//
//  IngredientsViewModel.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import Foundation

class IngredientsViewModel: ObservableObject {
    @Published var ingredientsByCategory: [IngredientCategory: [Ingredient]] = [:]
    @Published var searchText: String = ""
    
    var filteredIngredientsByCategory: [IngredientCategory: [Ingredient]] {
        if searchText.isEmpty {
            return ingredientsByCategory
        } else {
            var filtered: [IngredientCategory: [Ingredient]] = [:]
            let lowercasedSearch = searchText.lowercased()
            
            for (category, ingredients) in ingredientsByCategory {
                let filteredIngredients = ingredients.filter { ingredient in
                    ingredient.name.lowercased().contains(lowercasedSearch) ||
                    ingredient.category.rawValue.lowercased().contains(lowercasedSearch) ||
                    ingredient.emoji.contains(lowercasedSearch)
                }
                if !filteredIngredients.isEmpty {
                    filtered[category] = filteredIngredients
                }
            }
            return filtered
        }
    }
    
    var allFilteredIngredients: [Ingredient] {
        if searchText.isEmpty {
            return Ingredient.all
        } else {
            let lowercasedSearch = searchText.lowercased()
            return Ingredient.all.filter { ingredient in
                ingredient.name.lowercased().contains(lowercasedSearch) ||
                ingredient.category.rawValue.lowercased().contains(lowercasedSearch) ||
                ingredient.emoji.contains(lowercasedSearch)
            }
        }
    }
    
    init() {
        categorizeIngredients()
    }
    
    private func categorizeIngredients() {
        IngredientCategory.allCases.forEach { category in
            ingredientsByCategory[category] = Ingredient.all.filter { $0.category == category }
        }
    }
}
