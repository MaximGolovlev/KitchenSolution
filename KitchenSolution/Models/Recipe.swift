//
//  Recipe.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let ingredients: [Ingredient]
    let cookingTime: Int // in minutes
    let difficulty: Difficulty
    let steps: [RecipeStep]
    let imageName: String?
    let calories: Int?
    
    var isFavorite: Bool = false
}

struct RecipeStep: Identifiable, Codable {
    let id: String
    let description: String
    let duration: Int? // in seconds, optional for steps without timer
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}
