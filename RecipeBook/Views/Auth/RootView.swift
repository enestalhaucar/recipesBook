//
//  RootView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import SwiftUI

struct RootView: View {
    @State private var showWelcomeView : Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                ContentView(showWelcomeView: $showWelcomeView)
                    .environmentObject(RecipesViewModel())
            }
            .onAppear{
                let authUser = try? AuthenticationManager.shared.getAuthendicatedUser()
                self.showWelcomeView = authUser == nil
            }
            .fullScreenCover(isPresented: $showWelcomeView ) {
                NavigationStack {
                    WelcomeView(showWelcomeView: .constant(false))
                }
            }
            
        }
    }
}

#Preview {
    RootView()
}
