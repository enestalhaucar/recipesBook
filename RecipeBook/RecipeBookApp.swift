//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI
import FirebaseCore

@main
struct RecipeBookApp: App {
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
      }
    }
    
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
