//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI
import Firebase

@main
struct RecipeBookApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            // ContentView().environmentObject(recipesViewModel)
            RootView()
        }
    }
}
