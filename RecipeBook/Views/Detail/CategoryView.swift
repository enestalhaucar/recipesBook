//
//  CategoryView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 6.12.2023.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM : RecipesViewModel
    
    var category : Category
    
    // Computed Property
    var recipe : [Recipe] {
        return recipesVM.recipes.filter{ $0.category == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipe)
        }
        .navigationTitle(category.rawValue)
    }
}

#Preview {
    CategoryView(category: Category.breakfast)
        .environmentObject(RecipesViewModel())
}
