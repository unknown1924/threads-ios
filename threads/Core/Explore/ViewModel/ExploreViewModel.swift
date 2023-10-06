//
//  ExploreViewModel.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task { try await fetchUsers() }
    }

    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
