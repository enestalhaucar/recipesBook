//
//  ContentView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
