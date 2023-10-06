//
//  User.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
