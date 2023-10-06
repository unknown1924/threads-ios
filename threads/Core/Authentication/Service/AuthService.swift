//
//  AuthService.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(with email: String, using password: String) async throws {
        // handle login
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("login: \(result)")
//            print("DEBUG: user logged in  \(result.user.uid)")
        } catch {
            print("DEBUG: failed to login with error \(error.localizedDescription)")
        }
    }

    @MainActor
    func createUser(with email: String, using password: String, fullname: String, username: String) async throws {
        // handle create user
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
//            print("DEBUG: user created \(result.user.uid)")
            try await uploadUserData(email: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() {
        try? Auth.auth().signOut()      // sign out on firebase
        self.userSession = nil          // remove session locally
        UserService.shared.resetUser()  // sets current user to nil
    }

    private func uploadUserData(email: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        // encode user data
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
