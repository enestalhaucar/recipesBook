//
//  RecipeModel.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import Foundation

enum Category : String, CaseIterable, Identifiable {
    var id : String { self.rawValue}
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
    
}

struct Recipe : Identifiable {
    let id = UUID()
    let name : String
    let image : String
    let desc : String
    let ingredients : String
    let directions : String
    let category : Category.RawValue
    let datePublished : String
    let url : String
}


extension Recipe {
    static let all : [Recipe] = [
       Recipe(
        name: "Egg Toast",
        image: "https://images.pexels.com/photos/824635/pexels-photo-824635.jpeg",
        desc: "This baked omelet toast is a satisfying and healthy breakfast recipe that takes only 5 minutes of active work. Make it for your family or double (or even triple) the recipe to serve company.",
        ingredients: "4-5 large Egg\nSweet Paprika and Red Pepper\nA Bell Pepper, Cherry Tomatoes and Green Onions\nCrumbled Feta Cheese\nA few tablespoons of chopped flat-leaf parsley\nExtra Virgin Olive Oil\nBread",
        directions: "Prepare a flavorful egg and vegetable mixture by whisking together 4 to 5 large eggs, kosher salt, paprika, and red pepper flakes. Incorporate chopped bell pepper, cherry tomatoes, green onions, crumbled feta cheese, parsley, and a drizzle of olive oil. Lightly brush a sheet pan with olive oil and place 4 slices of bread on it. Spread the egg mixture evenly over the bread, ensuring a generous distribution of vegetables and feta cheese. Bake in a preheated 375°F oven for about 15 minutes until the eggs are cooked, and the vegetables have softened. This delightful dish combines the richness of eggs with a medley of vibrant vegetables, creating a delicious and satisfying meal.",
        category: Category.breakfast.rawValue,
        datePublished: "Dec 5, 2023",
        url: "https://www.themediterraneandish.com/egg-toast/")
    ]
}
