//
//  HomeView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM : RecipesViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeList(recipes: recipesVM.recipes)
            }
            .background(Color(red: 1, green: 0.98, blue: 0.93))
            .navigationTitle("My Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.blue, for: .navigationBar)
        }
        .navigationViewStyle(.stack)
       
    }
}

#Preview {
    HomeView()
        .environmentObject(RecipesViewModel())
}
