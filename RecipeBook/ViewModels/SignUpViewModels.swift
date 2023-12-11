//
//  SignUpViewModels.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 8.12.2023.
//

import Foundation

final class SignUpViewModels : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func singUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password found")
            return
        }
        let _ = try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
}
