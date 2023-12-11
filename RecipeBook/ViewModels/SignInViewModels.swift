//
//  SignInViewModels.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import Foundation

final class SignInViewModels : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    
    
    func singIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password found")
            return
        }
        let _ = try await AuthenticationManager.shared.signIn(email: email, password: password)
    }
}


