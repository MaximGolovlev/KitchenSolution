//
//  RecipeService.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//


import Foundation
import Combine

protocol RecipeService {
    func getRecipes() -> AnyPublisher<[Recipe], Error>
}

class MockRecipeService: RecipeService {
    func getRecipes() -> AnyPublisher<[Recipe], Error> {
        let recipes = [
            // Итальянская кухня
            Recipe(
                id: "1",
                title: "Classic Tomato Pasta",
                description: "Simple and delicious pasta with fresh tomatoes and basil",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!,
                    Ingredient.all.first(where: { $0.id == "basil" })!,
                    Ingredient.all.first(where: { $0.id == "olive_oil" })!,
                    Ingredient.all.first(where: { $0.id == "pasta" })!,
                    Ingredient.all.first(where: { $0.id == "salt" })!,
                    Ingredient.all.first(where: { $0.id == "parmesan" })!
                ],
                cookingTime: 25,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Boil water with salt for pasta", duration: 300),
                    RecipeStep(id: "2", description: "Chop tomatoes, garlic and basil", duration: 180),
                    RecipeStep(id: "3", description: "Sauté garlic in olive oil until golden", duration: 120),
                    RecipeStep(id: "4", description: "Add tomatoes and cook for 5 minutes", duration: 300),
                    RecipeStep(id: "5", description: "Add basil and simmer for 2 minutes", duration: 120),
                    RecipeStep(id: "6", description: "Mix with cooked pasta and serve with parmesan", duration: 60)
                ],
                imageName: "pasta",
                calories: 420
            ),
            
            Recipe(
                id: "2",
                title: "Margherita Pizza",
                description: "Classic Italian pizza with tomato sauce and mozzarella",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "flour" })!,
                    Ingredient.all.first(where: { $0.id == "tomato_sauce" })!,
                    Ingredient.all.first(where: { $0.id == "mozzarella" })!,
                    Ingredient.all.first(where: { $0.id == "basil" })!,
                    Ingredient.all.first(where: { $0.id == "olive_oil" })!,
                    Ingredient.all.first(where: { $0.id == "salt" })!
                ],
                cookingTime: 40,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Prepare pizza dough and let it rise", duration: 1200),
                    RecipeStep(id: "2", description: "Roll out the dough on a baking sheet", duration: 180),
                    RecipeStep(id: "3", description: "Spread tomato sauce evenly", duration: 60),
                    RecipeStep(id: "4", description: "Add mozzarella slices", duration: 60),
                    RecipeStep(id: "5", description: "Bake at 220°C for 12-15 minutes", duration: 780),
                    RecipeStep(id: "6", description: "Garnish with fresh basil and olive oil", duration: 30)
                ],
                imageName: "pizza",
                calories: 380
            ),

            // Азиатская кухня
            Recipe(
                id: "3",
                title: "Chicken Stir Fry",
                description: "Quick and healthy chicken stir fry with vegetables",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "chicken" })!,
                    Ingredient.all.first(where: { $0.id == "bell_pepper" })!,
                    Ingredient.all.first(where: { $0.id == "broccoli" })!,
                    Ingredient.all.first(where: { $0.id == "carrot" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!,
                    Ingredient.all.first(where: { $0.id == "ginger" })!,
                    Ingredient.all.first(where: { $0.id == "soy_sauce" })!,
                    Ingredient.all.first(where: { $0.id == "rice" })!
                ],
                cookingTime: 30,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Cook rice according to package instructions", duration: 900),
                    RecipeStep(id: "2", description: "Slice chicken and vegetables into strips", duration: 300),
                    RecipeStep(id: "3", description: "Stir-fry chicken until golden brown", duration: 300),
                    RecipeStep(id: "4", description: "Add garlic and ginger, cook for 1 minute", duration: 60),
                    RecipeStep(id: "5", description: "Add vegetables and stir-fry for 5 minutes", duration: 300),
                    RecipeStep(id: "6", description: "Add soy sauce and cook for 2 more minutes", duration: 120)
                ],
                imageName: "stir_fry",
                calories: 320
            ),

            Recipe(
                id: "4",
                title: "Vegetable Curry",
                description: "Spicy and aromatic vegetable curry with coconut milk",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "potato" })!,
                    Ingredient.all.first(where: { $0.id == "carrot" })!,
                    Ingredient.all.first(where: { $0.id == "cauliflower" })!,
                    Ingredient.all.first(where: { $0.id == "coconut" })!,
                    Ingredient.all.first(where: { $0.id == "ginger" })!,
                    Ingredient.all.first(where: { $0.id == "turmeric" })!,
                    Ingredient.all.first(where: { $0.id == "cumin" })!,
                    Ingredient.all.first(where: { $0.id == "coriander" })!,
                    Ingredient.all.first(where: { $0.id == "rice" })!
                ],
                cookingTime: 45,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Chop all vegetables into bite-sized pieces", duration: 300),
                    RecipeStep(id: "2", description: "Sauté ginger and spices in oil", duration: 120),
                    RecipeStep(id: "3", description: "Add vegetables and cook for 5 minutes", duration: 300),
                    RecipeStep(id: "4", description: "Add coconut milk and simmer for 20 minutes", duration: 1200),
                    RecipeStep(id: "5", description: "Cook rice as side dish", duration: 900),
                    RecipeStep(id: "6", description: "Garnish with fresh coriander", duration: 30)
                ],
                imageName: "curry",
                calories: 280
            ),

            // Американская кухня
            Recipe(
                id: "5",
                title: "Classic Beef Burger",
                description: "Juicy beef burger with fresh vegetables",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "beef" })!,
                    Ingredient.all.first(where: { $0.id == "bread" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "lettuce" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "cheese" })!,
                    Ingredient.all.first(where: { $0.id == "ketchup" })!,
                    Ingredient.all.first(where: { $0.id == "mustard" })!
                ],
                cookingTime: 25,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Form beef patties and season with salt/pepper", duration: 180),
                    RecipeStep(id: "2", description: "Grill patties for 4-5 minutes each side", duration: 600),
                    RecipeStep(id: "3", description: "Toast burger buns lightly", duration: 120),
                    RecipeStep(id: "4", description: "Slice tomatoes and onions", duration: 120),
                    RecipeStep(id: "5", description: "Assemble burgers with all ingredients", duration: 120),
                    RecipeStep(id: "6", description: "Serve with your favorite sauces", duration: 30)
                ],
                imageName: "burger",
                calories: 550
            ),

            // Здоровое питание
            Recipe(
                id: "6",
                title: "Greek Salad",
                description: "Fresh and healthy Mediterranean salad",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "cucumber" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "feta" })!,
                    Ingredient.all.first(where: { $0.id == "olive_oil" })!,
                    Ingredient.all.first(where: { $0.id == "lemon" })!,
                    Ingredient.all.first(where: { $0.id == "oregano" })!
                ],
                cookingTime: 15,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Chop cucumbers, tomatoes, and onions", duration: 300),
                    RecipeStep(id: "2", description: "Cube feta cheese", duration: 60),
                    RecipeStep(id: "3", description: "Mix all vegetables in a bowl", duration: 60),
                    RecipeStep(id: "4", description: "Add feta cheese", duration: 30),
                    RecipeStep(id: "5", description: "Prepare dressing with olive oil and lemon juice", duration: 60),
                    RecipeStep(id: "6", description: "Sprinkle with oregano and serve immediately", duration: 30)
                ],
                imageName: "salad",
                calories: 180
            ),

            Recipe(
                id: "7",
                title: "Oatmeal with Fruits",
                description: "Healthy breakfast oatmeal with fresh fruits",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "oats" })!,
                    Ingredient.all.first(where: { $0.id == "milk" })!,
                    Ingredient.all.first(where: { $0.id == "banana" })!,
                    Ingredient.all.first(where: { $0.id == "strawberry" })!,
                    Ingredient.all.first(where: { $0.id == "blueberry" })!,
                    Ingredient.all.first(where: { $0.id == "honey" })!,
                    Ingredient.all.first(where: { $0.id == "cinnamon" })!
                ],
                cookingTime: 10,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Cook oats with milk according to package", duration: 300),
                    RecipeStep(id: "2", description: "Slice banana and strawberries", duration: 120),
                    RecipeStep(id: "3", description: "Mix fruits into cooked oatmeal", duration: 60),
                    RecipeStep(id: "4", description: "Drizzle with honey", duration: 30),
                    RecipeStep(id: "5", description: "Sprinkle with cinnamon", duration: 15),
                    RecipeStep(id: "6", description: "Serve warm", duration: 30)
                ],
                imageName: "oatmeal",
                calories: 220
            ),

            // Мексиканская кухня
            Recipe(
                id: "8",
                title: "Guacamole",
                description: "Fresh avocado dip with tomatoes and lime",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "avocado" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "lime" })!,
                    Ingredient.all.first(where: { $0.id == "coriander" })!,
                    Ingredient.all.first(where: { $0.id == "chili" })!,
                    Ingredient.all.first(where: { $0.id == "salt" })!
                ],
                cookingTime: 10,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Mash avocados in a bowl", duration: 120),
                    RecipeStep(id: "2", description: "Dice tomatoes and onions finely", duration: 180),
                    RecipeStep(id: "3", description: "Chop coriander and chili", duration: 120),
                    RecipeStep(id: "4", description: "Mix all ingredients together", duration: 60),
                    RecipeStep(id: "5", description: "Add lime juice and salt to taste", duration: 60),
                    RecipeStep(id: "6", description: "Serve with tortilla chips", duration: 30)
                ],
                imageName: "guacamole",
                calories: 150
            ),

            // Десерты
            Recipe(
                id: "9",
                title: "Chocolate Brownies",
                description: "Rich and fudgy chocolate brownies",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "chocolate" })!,
                    Ingredient.all.first(where: { $0.id == "butter" })!,
                    Ingredient.all.first(where: { $0.id == "sugar" })!,
                    Ingredient.all.first(where: { $0.id == "eggs" })!,
                    Ingredient.all.first(where: { $0.id == "flour" })!,
                    Ingredient.all.first(where: { $0.id == "vanilla" })!,
                    Ingredient.all.first(where: { $0.id == "walnuts" })!
                ],
                cookingTime: 45,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Melt chocolate and butter together", duration: 180),
                    RecipeStep(id: "2", description: "Beat eggs with sugar until fluffy", duration: 180),
                    RecipeStep(id: "3", description: "Combine chocolate mixture with eggs", duration: 60),
                    RecipeStep(id: "4", description: "Fold in flour and vanilla", duration: 60),
                    RecipeStep(id: "5", description: "Add chopped walnuts", duration: 30),
                    RecipeStep(id: "6", description: "Bake at 180°C for 25-30 minutes", duration: 1800)
                ],
                imageName: "brownies",
                calories: 480
            ),

            Recipe(
                id: "10",
                title: "Fruit Smoothie",
                description: "Refreshing and healthy fruit smoothie",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "banana" })!,
                    Ingredient.all.first(where: { $0.id == "strawberry" })!,
                    Ingredient.all.first(where: { $0.id == "blueberry" })!,
                    Ingredient.all.first(where: { $0.id == "yogurt" })!,
                    Ingredient.all.first(where: { $0.id == "milk" })!,
                    Ingredient.all.first(where: { $0.id == "honey" })!
                ],
                cookingTime: 5,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Peel and slice banana", duration: 60),
                    RecipeStep(id: "2", description: "Wash strawberries and blueberries", duration: 60),
                    RecipeStep(id: "3", description: "Add all fruits to blender", duration: 30),
                    RecipeStep(id: "4", description: "Add yogurt and milk", duration: 30),
                    RecipeStep(id: "5", description: "Blend until smooth", duration: 60),
                    RecipeStep(id: "6", description: "Add honey to taste and serve chilled", duration: 30)
                ],
                imageName: "smoothie",
                calories: 180
            ),

            // Вегетарианские рецепты
            Recipe(
                id: "11",
                title: "Tofu Stir Fry",
                description: "Protein-packed tofu stir fry with vegetables",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "tofu" })!,
                    Ingredient.all.first(where: { $0.id == "broccoli" })!,
                    Ingredient.all.first(where: { $0.id == "bell_pepper" })!,
                    Ingredient.all.first(where: { $0.id == "carrot" })!,
                    Ingredient.all.first(where: { $0.id == "ginger" })!,
                    Ingredient.all.first(where: { $0.id == "soy_sauce" })!,
                    Ingredient.all.first(where: { $0.id == "rice" })!
                ],
                cookingTime: 30,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Press tofu to remove excess water", duration: 600),
                    RecipeStep(id: "2", description: "Cube tofu and marinate in soy sauce", duration: 300),
                    RecipeStep(id: "3", description: "Chop all vegetables", duration: 180),
                    RecipeStep(id: "4", description: "Stir-fry tofu until golden", duration: 300),
                    RecipeStep(id: "5", description: "Add vegetables and ginger, cook for 5 minutes", duration: 300),
                    RecipeStep(id: "6", description: "Serve with cooked rice", duration: 60)
                ],
                imageName: "tofu_stirfry",
                calories: 250
            ),

            Recipe(
                id: "12",
                title: "Lentil Soup",
                description: "Hearty and nutritious lentil soup",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "lentils" })!,
                    Ingredient.all.first(where: { $0.id == "carrot" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "cumin" })!,
                    Ingredient.all.first(where: { $0.id == "paprika" })!,
                    Ingredient.all.first(where: { $0.id == "lemon" })!
                ],
                cookingTime: 40,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Rinse lentils thoroughly", duration: 120),
                    RecipeStep(id: "2", description: "Chop all vegetables", duration: 180),
                    RecipeStep(id: "3", description: "Sauté onions and garlic until soft", duration: 180),
                    RecipeStep(id: "4", description: "Add lentils and vegetables, cover with water", duration: 120),
                    RecipeStep(id: "5", description: "Simmer for 25 minutes until lentils are tender", duration: 1500),
                    RecipeStep(id: "6", description: "Add spices and lemon juice before serving", duration: 60)
                ],
                imageName: "lentil_soup",
                calories: 200
            ),

            // Новые рецепты
            Recipe(
                id: "13",
                title: "Caesar Salad",
                description: "Classic Caesar salad with crispy croutons",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "lettuce" })!,
                    Ingredient.all.first(where: { $0.id == "bread" })!,
                    Ingredient.all.first(where: { $0.id == "parmesan" })!,
                    Ingredient.all.first(where: { $0.id == "lemon" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!,
                    Ingredient.all.first(where: { $0.id == "olive_oil" })!,
                    Ingredient.all.first(where: { $0.id == "eggs" })!
                ],
                cookingTime: 20,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Make croutons from bread cubes", duration: 300),
                    RecipeStep(id: "2", description: "Wash and chop lettuce", duration: 120),
                    RecipeStep(id: "3", description: "Prepare Caesar dressing", duration: 180),
                    RecipeStep(id: "4", description: "Toss lettuce with dressing", duration: 60),
                    RecipeStep(id: "5", description: "Add croutons and parmesan shavings", duration: 60),
                    RecipeStep(id: "6", description: "Serve immediately", duration: 30)
                ],
                imageName: "caesar_salad",
                calories: 320
            ),

            Recipe(
                id: "14",
                title: "Ratatouille",
                description: "French vegetable stew with herbs",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "eggplant" })!,
                    Ingredient.all.first(where: { $0.id == "zucchini" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "bell_pepper" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!,
                    Ingredient.all.first(where: { $0.id == "thyme" })!,
                    Ingredient.all.first(where: { $0.id == "rosemary" })!
                ],
                cookingTime: 50,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Slice all vegetables evenly", duration: 300),
                    RecipeStep(id: "2", description: "Sauté onions and garlic until soft", duration: 180),
                    RecipeStep(id: "3", description: "Layer vegetables in baking dish", duration: 120),
                    RecipeStep(id: "4", description: "Add herbs and olive oil", duration: 60),
                    RecipeStep(id: "5", description: "Bake at 190°C for 35 minutes", duration: 2100),
                    RecipeStep(id: "6", description: "Let rest for 5 minutes before serving", duration: 300)
                ],
                imageName: "ratatouille",
                calories: 180
            ),

            Recipe(
                id: "15",
                title: "Chicken Noodle Soup",
                description: "Comforting chicken noodle soup for cold days",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "chicken" })!,
                    Ingredient.all.first(where: { $0.id == "carrot" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "celery" })!,
                    Ingredient.all.first(where: { $0.id == "pasta" })!,
                    Ingredient.all.first(where: { $0.id == "thyme" })!,
                    Ingredient.all.first(where: { $0.id == "bay_leaves" })!
                ],
                cookingTime: 45,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Cook chicken in water to make broth", duration: 1800),
                    RecipeStep(id: "2", description: "Chop vegetables", duration: 180),
                    RecipeStep(id: "3", description: "Sauté vegetables until soft", duration: 180),
                    RecipeStep(id: "4", description: "Add broth and shredded chicken", duration: 120),
                    RecipeStep(id: "5", description: "Add noodles and cook for 10 minutes", duration: 600),
                    RecipeStep(id: "6", description: "Season with herbs and serve hot", duration: 60)
                ],
                imageName: "chicken_soup",
                calories: 280
            ),

            Recipe(
                id: "16",
                title: "Berry Parfait",
                description: "Layered yogurt parfait with fresh berries",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "yogurt" })!,
                    Ingredient.all.first(where: { $0.id == "strawberry" })!,
                    Ingredient.all.first(where: { $0.id == "blueberry" })!,
                    Ingredient.all.first(where: { $0.id == "raspberry" })!,
                    Ingredient.all.first(where: { $0.id == "granola" })!,
                    Ingredient.all.first(where: { $0.id == "honey" })!
                ],
                cookingTime: 5,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Wash and slice berries", duration: 120),
                    RecipeStep(id: "2", description: "Layer yogurt in glass", duration: 30),
                    RecipeStep(id: "3", description: "Add layer of berries", duration: 30),
                    RecipeStep(id: "4", description: "Sprinkle with granola", duration: 30),
                    RecipeStep(id: "5", description: "Repeat layers", duration: 60),
                    RecipeStep(id: "6", description: "Drizzle with honey and serve", duration: 30)
                ],
                imageName: "parfait",
                calories: 220
            ),

            Recipe(
                id: "17",
                title: "Beef Tacos",
                description: "Mexican-style beef tacos with fresh toppings",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "beef" })!,
                    Ingredient.all.first(where: { $0.id == "tortillas" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "lettuce" })!,
                    Ingredient.all.first(where: { $0.id == "cheese" })!,
                    Ingredient.all.first(where: { $0.id == "sour_cream" })!,
                    Ingredient.all.first(where: { $0.id == "cumin" })!,
                    Ingredient.all.first(where: { $0.id == "chili" })!
                ],
                cookingTime: 25,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Cook ground beef with spices", duration: 600),
                    RecipeStep(id: "2", description: "Warm tortillas", duration: 120),
                    RecipeStep(id: "3", description: "Chop tomatoes and lettuce", duration: 120),
                    RecipeStep(id: "4", description: "Grate cheese", duration: 60),
                    RecipeStep(id: "5", description: "Assemble tacos with all ingredients", duration: 120),
                    RecipeStep(id: "6", description: "Top with sour cream and serve", duration: 30)
                ],
                imageName: "tacos",
                calories: 380
            ),

            Recipe(
                id: "18",
                title: "Mushroom Risotto",
                description: "Creamy Italian risotto with mushrooms",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "mushroom" })!,
                    Ingredient.all.first(where: { $0.id == "rice" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!,
                    Ingredient.all.first(where: { $0.id == "parmesan" })!,
                    Ingredient.all.first(where: { $0.id == "butter" })!,
                    Ingredient.all.first(where: { $0.id == "white_wine" })!
                ],
                cookingTime: 35,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Sauté mushrooms until golden", duration: 300),
                    RecipeStep(id: "2", description: "Cook onions and garlic until soft", duration: 180),
                    RecipeStep(id: "3", description: "Add rice and toast for 2 minutes", duration: 120),
                    RecipeStep(id: "4", description: "Add wine and cook until absorbed", duration: 180),
                    RecipeStep(id: "5", description: "Add broth gradually, stirring constantly", duration: 1200),
                    RecipeStep(id: "6", description: "Stir in butter and parmesan before serving", duration: 60)
                ],
                imageName: "risotto",
                calories: 420
            ),

            Recipe(
                id: "19",
                title: "Apple Pie",
                description: "Classic American apple pie with cinnamon",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "apple" })!,
                    Ingredient.all.first(where: { $0.id == "flour" })!,
                    Ingredient.all.first(where: { $0.id == "butter" })!,
                    Ingredient.all.first(where: { $0.id == "sugar" })!,
                    Ingredient.all.first(where: { $0.id == "cinnamon" })!,
                    Ingredient.all.first(where: { $0.id == "lemon" })!,
                    Ingredient.all.first(where: { $0.id == "vanilla" })!
                ],
                cookingTime: 60,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Prepare pie crust and chill", duration: 1800),
                    RecipeStep(id: "2", description: "Peel and slice apples", duration: 300),
                    RecipeStep(id: "3", description: "Mix apples with sugar and spices", duration: 120),
                    RecipeStep(id: "4", description: "Fill pie crust with apple mixture", duration: 120),
                    RecipeStep(id: "5", description: "Add top crust and vent", duration: 180),
                    RecipeStep(id: "6", description: "Bake at 190°C for 45 minutes", duration: 2700)
                ],
                imageName: "apple_pie",
                calories: 350
            ),

            Recipe(
                id: "20",
                title: "Greek Yogurt Bowl",
                description: "Protein-rich Greek yogurt with toppings",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "yogurt" })!,
                    Ingredient.all.first(where: { $0.id == "honey" })!,
                    Ingredient.all.first(where: { $0.id == "walnuts" })!,
                    Ingredient.all.first(where: { $0.id == "banana" })!,
                    Ingredient.all.first(where: { $0.id == "cinnamon" })!,
                    Ingredient.all.first(where: { $0.id == "chia_seeds" })!
                ],
                cookingTime: 5,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Scoop Greek yogurt into bowl", duration: 30),
                    RecipeStep(id: "2", description: "Slice banana", duration: 60),
                    RecipeStep(id: "3", description: "Chop walnuts", duration: 60),
                    RecipeStep(id: "4", description: "Arrange toppings on yogurt", duration: 60),
                    RecipeStep(id: "5", description: "Drizzle with honey", duration: 30),
                    RecipeStep(id: "6", description: "Sprinkle with cinnamon and chia seeds", duration: 30)
                ],
                imageName: "yogurt_bowl",
                calories: 280
            ),

            Recipe(
                id: "21",
                title: "Salmon with Roasted Vegetables",
                description: "Healthy baked salmon with seasonal vegetables",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "salmon" })!,
                    Ingredient.all.first(where: { $0.id == "asparagus" })!,
                    Ingredient.all.first(where: { $0.id == "cherry_tomatoes" })!,
                    Ingredient.all.first(where: { $0.id == "lemon" })!,
                    Ingredient.all.first(where: { $0.id == "olive_oil" })!,
                    Ingredient.all.first(where: { $0.id == "dill" })!,
                    Ingredient.all.first(where: { $0.id == "garlic" })!
                ],
                cookingTime: 25,
                difficulty: .medium,
                steps: [
                    RecipeStep(id: "1", description: "Preheat oven to 200°C", duration: 300),
                    RecipeStep(id: "2", description: "Season salmon with herbs and lemon", duration: 120),
                    RecipeStep(id: "3", description: "Arrange vegetables on baking sheet", duration: 120),
                    RecipeStep(id: "4", description: "Drizzle with olive oil and season", duration: 60),
                    RecipeStep(id: "5", description: "Bake for 15-18 minutes", duration: 1080),
                    RecipeStep(id: "6", description: "Rest for 2 minutes before serving", duration: 120)
                ],
                imageName: "salmon",
                calories: 320
            ),

            Recipe(
                id: "22",
                title: "Chocolate Chip Cookies",
                description: "Classic homemade chocolate chip cookies",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "flour" })!,
                    Ingredient.all.first(where: { $0.id == "butter" })!,
                    Ingredient.all.first(where: { $0.id == "sugar" })!,
                    Ingredient.all.first(where: { $0.id == "eggs" })!,
                    Ingredient.all.first(where: { $0.id == "chocolate" })!,
                    Ingredient.all.first(where: { $0.id == "vanilla" })!,
                    Ingredient.all.first(where: { $0.id == "baking_soda" })!
                ],
                cookingTime: 30,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Cream butter and sugars together", duration: 180),
                    RecipeStep(id: "2", description: "Beat in eggs and vanilla", duration: 120),
                    RecipeStep(id: "3", description: "Mix in flour and baking soda", duration: 120),
                    RecipeStep(id: "4", description: "Fold in chocolate chips", duration: 60),
                    RecipeStep(id: "5", description: "Drop cookies onto baking sheet", duration: 120),
                    RecipeStep(id: "6", description: "Bake at 180°C for 10-12 minutes", duration: 720)
                ],
                imageName: "cookies",
                calories: 150
            ),

            Recipe(
                id: "23",
                title: "Vegetable Omelette",
                description: "Fluffy omelette with fresh vegetables",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "eggs" })!,
                    Ingredient.all.first(where: { $0.id == "bell_pepper" })!,
                    Ingredient.all.first(where: { $0.id == "onion" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "cheese" })!,
                    Ingredient.all.first(where: { $0.id == "milk" })!,
                    Ingredient.all.first(where: { $0.id == "butter" })!
                ],
                cookingTime: 15,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Chop vegetables", duration: 180),
                    RecipeStep(id: "2", description: "Beat eggs with milk and season", duration: 120),
                    RecipeStep(id: "3", description: "Sauté vegetables until soft", duration: 180),
                    RecipeStep(id: "4", description: "Pour egg mixture over vegetables", duration: 60),
                    RecipeStep(id: "5", description: "Cook until edges set, then flip", duration: 180),
                    RecipeStep(id: "6", description: "Add cheese and fold omelette", duration: 60)
                ],
                imageName: "omelette",
                calories: 280
            ),

            Recipe(
                id: "24",
                title: "Banana Bread",
                description: "Moist and delicious banana bread",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "banana" })!,
                    Ingredient.all.first(where: { $0.id == "flour" })!,
                    Ingredient.all.first(where: { $0.id == "sugar" })!,
                    Ingredient.all.first(where: { $0.id == "eggs" })!,
                    Ingredient.all.first(where: { $0.id == "butter" })!,
                    Ingredient.all.first(where: { $0.id == "walnuts" })!,
                    Ingredient.all.first(where: { $0.id == "cinnamon" })!
                ],
                cookingTime: 65,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Mash ripe bananas", duration: 120),
                    RecipeStep(id: "2", description: "Cream butter and sugar", duration: 180),
                    RecipeStep(id: "3", description: "Mix in eggs and bananas", duration: 120),
                    RecipeStep(id: "4", description: "Fold in flour and spices", duration: 120),
                    RecipeStep(id: "5", description: "Add chopped walnuts", duration: 60),
                    RecipeStep(id: "6", description: "Bake at 180°C for 55-60 minutes", duration: 3300)
                ],
                imageName: "banana_bread",
                calories: 250
            ),

            Recipe(
                id: "25",
                title: "Caprese Skewers",
                description: "Easy appetizer with mozzarella and tomatoes",
                ingredients: [
                    Ingredient.all.first(where: { $0.id == "mozzarella" })!,
                    Ingredient.all.first(where: { $0.id == "tomato" })!,
                    Ingredient.all.first(where: { $0.id == "basil" })!,
                    Ingredient.all.first(where: { $0.id == "olive_oil" })!,
                    Ingredient.all.first(where: { $0.id == "balsamic" })!,
                    Ingredient.all.first(where: { $0.id == "salt" })!
                ],
                cookingTime: 10,
                difficulty: .easy,
                steps: [
                    RecipeStep(id: "1", description: "Cut mozzarella and tomatoes into cubes", duration: 180),
                    RecipeStep(id: "2", description: "Wash basil leaves", duration: 60),
                    RecipeStep(id: "3", description: "Thread onto skewers alternately", duration: 180),
                    RecipeStep(id: "4", description: "Arrange on serving platter", duration: 60),
                    RecipeStep(id: "5", description: "Drizzle with olive oil and balsamic", duration: 60),
                    RecipeStep(id: "6", description: "Season with salt and serve", duration: 30)
                ],
                imageName: "caprese",
                calories: 180
            )
        ]
        
        return Just(recipes)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
