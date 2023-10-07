//
//  Thread.swift
//  threads
//
//  Created by Debasis Mandal on 08/10/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?

    var id: String { threadId ?? NSUUID().uuidString }
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int

    var user: User?
}
