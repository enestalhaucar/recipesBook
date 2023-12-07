//
//  AuthenticationManager.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid : String
    let email : String?
    
    init(user : User) {
        self.uid = user.uid
        self.email = user.email
    }
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() { }
    
    func getAuthendicatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let AuthDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: AuthDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
