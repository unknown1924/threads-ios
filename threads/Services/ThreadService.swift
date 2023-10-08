//
//  ThreadService.swift
//  threads
//
//  Created by Debasis Mandal on 08/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }

    static func fetchAllThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    }
}
