//
//  RecipesViewModel.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 6.12.2023.
//

import Foundation

class RecipesViewModel : ObservableObject {
    @Published private(set) var recipes : [Recipe] = []
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
