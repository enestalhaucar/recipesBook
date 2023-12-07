//
//  TabBar.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct TabBar: View {
    @Binding var showWelcomeView : Bool
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            NewRecipeView()
                .tabItem {
                    Label("New", systemImage: "plus")
                }
            FavoritiesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            SettingsView(showWelcomeView: $showWelcomeView)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
    }
}

#Preview {
    TabBar(showWelcomeView: .constant(false))
        .environmentObject(RecipesViewModel())
}
