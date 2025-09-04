//
//  LocalDataService.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import Foundation

class LocalDataService {
    private let favoritesKey = "favoriteRecipes"
    
    func saveFavorites(_ recipeIds: [String]) {
        UserDefaults.standard.set(recipeIds, forKey: favoritesKey)
    }
    
    func loadFavorites() -> [String] {
        UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
    }
}