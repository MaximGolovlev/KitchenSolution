//
//  RecipeViewModel.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var selectedIngredients: Set<Ingredient> = [] {
        didSet {
            updateRecipeCount()
        }
    }
    @Published var allRecipes: [Recipe] = []
    @Published var favoriteRecipes: [Recipe] = []
    @Published var availableRecipesCount: Int = 0 // Новое свойство для счетчика
    
    var filteredRecipes: [Recipe] {
        if selectedIngredients.isEmpty {
            return allRecipes
        } else {
            let f = allRecipes.filter { recipe in
                selectedIngredients.isSubset(of: Set(recipe.ingredients))
            }
            return f
        }
    }
    
    private let recipeService: RecipeService
    private let localDataService: LocalDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(recipeService: RecipeService = MockRecipeService(), 
         localDataService: LocalDataService = LocalDataService()) {
        self.recipeService = recipeService
        self.localDataService = localDataService
        loadRecipes()
    }
    
    func loadRecipes() {
        recipeService.getRecipes()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle error
            } receiveValue: { [weak self] recipes in
                self?.allRecipes = recipes
                self?.loadFavorites()
                self?.updateRecipeCount()
            }
            .store(in: &cancellables)
    }
    
    func toggleIngredientSelection(_ ingredient: Ingredient) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
    
    func toggleFavorite(for recipe: Recipe) {
        if let index = allRecipes.firstIndex(where: { $0.id == recipe.id }) {
            allRecipes[index].isFavorite.toggle()
            saveFavorites()
            loadFavorites()
            updateRecipeCount()
        }
    }
    
    private func loadFavorites() {
        let ids = localDataService.loadFavorites()
        allRecipes.enumerated().forEach({ (index, val) in
            if ids.contains(val.id) {
                allRecipes[index].isFavorite = true
            }
        })
        favoriteRecipes = allRecipes.filter { $0.isFavorite }
    }
    
    private func saveFavorites() {
        let favoriteIds = allRecipes.filter { $0.isFavorite }.map { $0.id }
        localDataService.saveFavorites(favoriteIds)
    }
    
    private func updateRecipeCount() {
        availableRecipesCount = filteredRecipes.count
    }
}
