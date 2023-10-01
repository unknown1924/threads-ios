//
//  RegistrationViewModel.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: create user")
        try await AuthService.shared.createUser(with: email, using: password, fullname: fullname, username: username)
    }
}
