//
//  AuthService.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(with email: String, using password: String) async throws {
        // handle login
    }
    
    @MainActor
    func createUser(with email: String, using password: String, fullname: String, username: String) async throws {
        // handle create user
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: user created \(result.user.uid)")
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
}
