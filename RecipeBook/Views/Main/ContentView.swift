//
//  ContentView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var showWelcomeView : Bool
    var body: some View {
        TabBar(showWelcomeView: $showWelcomeView)
    }
}

#Preview {
    ContentView(showWelcomeView: .constant(false))
        .environmentObject(RecipesViewModel())
}
