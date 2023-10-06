//
//  PreviewProvider.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()

    let user = User(id: NSUUID().uuidString, fullname: "Kali Katnip", email: "kat@gmail.com", username: "the_catonator")
}
