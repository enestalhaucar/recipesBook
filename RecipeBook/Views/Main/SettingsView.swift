//
//  SettingsView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showWelcomeView : Bool
    var body: some View {
        NavigationView {
            List {
                Button("Log Out") {
                    Task {
                        do {
                            try viewModel.signOut()
                            showWelcomeView = true
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showWelcomeView: .constant(false))
    }
}
