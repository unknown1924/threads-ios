//
//  FeedViewModel.swift
//  threads
//
//  Created by Debasis Mandal on 08/10/23.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()

    init() {
        Task { try await fetchAllThreads() }
    }

    func fetchAllThreads() async throws {
        threads = try await ThreadService.fetchAllThreads()
        try await fetchUserDataForThreads()
    }

    private func fetchUserDataForThreads() async throws {

        // thread is let const but threads isn't
        for i in 0..<threads.count {
            let ownerUid = threads[i].ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
