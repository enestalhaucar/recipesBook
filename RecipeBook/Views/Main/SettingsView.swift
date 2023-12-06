//
//  SettingsView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Settings")
                .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SettingsView()
}
