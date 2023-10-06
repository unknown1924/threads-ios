//
//  UserService.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?

    static let shared = UserService()

    init() {
        Task { try await fetchCurrentUser() }
    }

    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)

        self.currentUser = user

        print("DEBUG: User is \(user)")
    }

    func resetUser() {
        self.currentUser = nil
    }
}
