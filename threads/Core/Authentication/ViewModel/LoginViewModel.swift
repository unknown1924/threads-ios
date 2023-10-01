//
//  LoginViewModel.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func loginUser() async throws {
        print("DEBUG: login user")
        try await AuthService.shared.login(with: email, using: password)
    }
}
