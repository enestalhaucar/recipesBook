//
//  SettingsViewModel.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import Foundation

final class SettingsViewModel : ObservableObject {
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
    }
}
