//
//  Ingredient.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//

import Foundation

struct Ingredient: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let category: IngredientCategory
    let emoji: String
    
    static let all: [Ingredient] = [
        // Vegetables
        Ingredient(id: "tomato", name: "Tomato", category: .vegetables, emoji: "🍅"),
        Ingredient(id: "onion", name: "Onion", category: .vegetables, emoji: "🧅"),
        Ingredient(id: "garlic", name: "Garlic", category: .vegetables, emoji: "🧄"),
        Ingredient(id: "carrot", name: "Carrot", category: .vegetables, emoji: "🥕"),
        Ingredient(id: "potato", name: "Potato", category: .vegetables, emoji: "🥔"),
        Ingredient(id: "cucumber", name: "Cucumber", category: .vegetables, emoji: "🥒"),
        Ingredient(id: "bell_pepper", name: "Bell Pepper", category: .vegetables, emoji: "🫑"),
        Ingredient(id: "broccoli", name: "Broccoli", category: .vegetables, emoji: "🥦"),
        Ingredient(id: "mushroom", name: "Mushroom", category: .vegetables, emoji: "🍄"),
        Ingredient(id: "avocado", name: "Avocado", category: .vegetables, emoji: "🥑"),
        Ingredient(id: "corn", name: "Corn", category: .vegetables, emoji: "🌽"),
        Ingredient(id: "eggplant", name: "Eggplant", category: .vegetables, emoji: "🍆"),
        Ingredient(id: "spinach", name: "Spinach", category: .vegetables, emoji: "🍃"),
        Ingredient(id: "lettuce", name: "Lettuce", category: .vegetables, emoji: "🥬"),
        Ingredient(id: "zucchini", name: "Zucchini", category: .vegetables, emoji: "🥒"),
        Ingredient(id: "cauliflower", name: "Cauliflower", category: .vegetables, emoji: "🥦"),
        Ingredient(id: "celery", name: "Celery", category: .vegetables, emoji: "🥬"),
        Ingredient(id: "asparagus", name: "Asparagus", category: .vegetables, emoji: "🌱"),
        Ingredient(id: "cherry_tomatoes", name: "Cherry Tomatoes", category: .vegetables, emoji: "🍅"),
        
        // Proteins
        Ingredient(id: "chicken", name: "Chicken", category: .proteins, emoji: "🍗"),
        Ingredient(id: "beef", name: "Beef", category: .proteins, emoji: "🥩"),
        Ingredient(id: "pork", name: "Pork", category: .proteins, emoji: "🐖"),
        Ingredient(id: "fish", name: "Fish", category: .proteins, emoji: "🐟"),
        Ingredient(id: "salmon", name: "Salmon", category: .proteins, emoji: "🍣"),
        Ingredient(id: "tuna", name: "Tuna", category: .proteins, emoji: "🐟"),
        Ingredient(id: "shrimp", name: "Shrimp", category: .proteins, emoji: "🦐"),
        Ingredient(id: "eggs", name: "Eggs", category: .proteins, emoji: "🥚"),
        Ingredient(id: "tofu", name: "Tofu", category: .proteins, emoji: "🧈"),
        Ingredient(id: "tempeh", name: "Tempeh", category: .proteins, emoji: "🥠"),
        Ingredient(id: "lentils", name: "Lentils", category: .proteins, emoji: "🫘"),
        Ingredient(id: "chickpeas", name: "Chickpeas", category: .proteins, emoji: "🫘"),
        Ingredient(id: "beans", name: "Beans", category: .proteins, emoji: "🫘"),
        
        // Dairy
        Ingredient(id: "milk", name: "Milk", category: .dairy, emoji: "🥛"),
        Ingredient(id: "cheese", name: "Cheese", category: .dairy, emoji: "🧀"),
        Ingredient(id: "yogurt", name: "Yogurt", category: .dairy, emoji: "🥣"),
        Ingredient(id: "butter", name: "Butter", category: .dairy, emoji: "🧈"),
        Ingredient(id: "cream", name: "Cream", category: .dairy, emoji: "🍦"),
        Ingredient(id: "sour_cream", name: "Sour Cream", category: .dairy, emoji: "🥛"),
        Ingredient(id: "cottage_cheese", name: "Cottage Cheese", category: .dairy, emoji: "🧀"),
        Ingredient(id: "mozzarella", name: "Mozzarella", category: .dairy, emoji: "🧀"),
        Ingredient(id: "parmesan", name: "Parmesan", category: .dairy, emoji: "🧀"),
        Ingredient(id: "feta", name: "Feta Cheese", category: .dairy, emoji: "🧀"),
        
        // Grains
        Ingredient(id: "rice", name: "Rice", category: .grains, emoji: "🍚"),
        Ingredient(id: "pasta", name: "Pasta", category: .grains, emoji: "🍝"),
        Ingredient(id: "bread", name: "Bread", category: .grains, emoji: "🍞"),
        Ingredient(id: "flour", name: "Flour", category: .grains, emoji: "🌾"),
        Ingredient(id: "oats", name: "Oats", category: .grains, emoji: "🥣"),
        Ingredient(id: "quinoa", name: "Quinoa", category: .grains, emoji: "🌾"),
        Ingredient(id: "couscous", name: "Couscous", category: .grains, emoji: "🍚"),
        Ingredient(id: "buckwheat", name: "Buckwheat", category: .grains, emoji: "🌾"),
        Ingredient(id: "barley", name: "Barley", category: .grains, emoji: "🌾"),
        Ingredient(id: "cereal", name: "Cereal", category: .grains, emoji: "🥣"),
        Ingredient(id: "granola", name: "Granola", category: .grains, emoji: "🥣"),
        Ingredient(id: "tortillas", name: "Tortillas", category: .grains, emoji: "🫓"),
        
        // Spices & Herbs
        Ingredient(id: "salt", name: "Salt", category: .spices, emoji: "🧂"),
        Ingredient(id: "pepper", name: "Pepper", category: .spices, emoji: "🌶️"),
        Ingredient(id: "paprika", name: "Paprika", category: .spices, emoji: "🌶️"),
        Ingredient(id: "cinnamon", name: "Cinnamon", category: .spices, emoji: "🪵"),
        Ingredient(id: "basil", name: "Basil", category: .spices, emoji: "🌿"),
        Ingredient(id: "oregano", name: "Oregano", category: .spices, emoji: "🌿"),
        Ingredient(id: "thyme", name: "Thyme", category: .spices, emoji: "🌿"),
        Ingredient(id: "rosemary", name: "Rosemary", category: .spices, emoji: "🌿"),
        Ingredient(id: "ginger", name: "Ginger", category: .spices, emoji: "🫚"),
        Ingredient(id: "turmeric", name: "Turmeric", category: .spices, emoji: "🟨"),
        Ingredient(id: "cumin", name: "Cumin", category: .spices, emoji: "🌰"),
        Ingredient(id: "coriander", name: "Coriander", category: .spices, emoji: "🌿"),
        Ingredient(id: "chili", name: "Chili", category: .spices, emoji: "🌶️"),
        Ingredient(id: "vanilla", name: "Vanilla", category: .spices, emoji: "🌱"),
        Ingredient(id: "bay_leaves", name: "Bay Leaves", category: .spices, emoji: "🌿"),
        Ingredient(id: "dill", name: "Dill", category: .spices, emoji: "🌿"),
        
        // Fruits
        Ingredient(id: "apple", name: "Apple", category: .fruits, emoji: "🍎"),
        Ingredient(id: "banana", name: "Banana", category: .fruits, emoji: "🍌"),
        Ingredient(id: "orange", name: "Orange", category: .fruits, emoji: "🍊"),
        Ingredient(id: "lemon", name: "Lemon", category: .fruits, emoji: "🍋"),
        Ingredient(id: "lime", name: "Lime", category: .fruits, emoji: "🍋"),
        Ingredient(id: "strawberry", name: "Strawberry", category: .fruits, emoji: "🍓"),
        Ingredient(id: "blueberry", name: "Blueberry", category: .fruits, emoji: "🫐"),
        Ingredient(id: "raspberry", name: "Raspberry", category: .fruits, emoji: "🍇"),
        Ingredient(id: "pineapple", name: "Pineapple", category: .fruits, emoji: "🍍"),
        Ingredient(id: "mango", name: "Mango", category: .fruits, emoji: "🥭"),
        Ingredient(id: "peach", name: "Peach", category: .fruits, emoji: "🍑"),
        Ingredient(id: "pear", name: "Pear", category: .fruits, emoji: "🍐"),
        Ingredient(id: "grapes", name: "Grapes", category: .fruits, emoji: "🍇"),
        Ingredient(id: "watermelon", name: "Watermelon", category: .fruits, emoji: "🍉"),
        Ingredient(id: "kiwi", name: "Kiwi", category: .fruits, emoji: "🥝"),
        
        // Other
        Ingredient(id: "olive_oil", name: "Olive Oil", category: .other, emoji: "🫒"),
        Ingredient(id: "vinegar", name: "Vinegar", category: .other, emoji: "🍶"),
        Ingredient(id: "soy_sauce", name: "Soy Sauce", category: .other, emoji: "🍶"),
        Ingredient(id: "honey", name: "Honey", category: .other, emoji: "🍯"),
        Ingredient(id: "sugar", name: "Sugar", category: .other, emoji: "🍬"),
        Ingredient(id: "chocolate", name: "Chocolate", category: .other, emoji: "🍫"),
        Ingredient(id: "nuts", name: "Nuts", category: .other, emoji: "🥜"),
        Ingredient(id: "almonds", name: "Almonds", category: .other, emoji: "🌰"),
        Ingredient(id: "walnuts", name: "Walnuts", category: .other, emoji: "🌰"),
        Ingredient(id: "peanuts", name: "Peanuts", category: .other, emoji: "🥜"),
        Ingredient(id: "coconut", name: "Coconut", category: .other, emoji: "🥥"),
        Ingredient(id: "tomato_sauce", name: "Tomato Sauce", category: .other, emoji: "🍅"),
        Ingredient(id: "mustard", name: "Mustard", category: .other, emoji: "🟨"),
        Ingredient(id: "ketchup", name: "Ketchup", category: .other, emoji: "🍅"),
        Ingredient(id: "mayonnaise", name: "Mayonnaise", category: .other, emoji: "🫕"),
        Ingredient(id: "white_wine", name: "White Wine", category: .other, emoji: "🍾"),
        Ingredient(id: "chia_seeds", name: "Chia Seeds", category: .other, emoji: "🌱"),
        Ingredient(id: "baking_soda", name: "Baking Soda", category: .other, emoji: "🧂"),
        Ingredient(id: "balsamic", name: "Balsamic Vinegar", category: .other, emoji: "🍶"),
    ]
}

enum IngredientCategory: String, Codable, CaseIterable {
    case vegetables = "Vegetables"
    case proteins = "Proteins"
    case dairy = "Dairy"
    case grains = "Grains"
    case spices = "Spices"
    case fruits = "Fruits"
    case other = "Other"
}
