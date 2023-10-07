//
//  CircularProfileVIew.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case small
    case medium
    case large

    var dimension: CGFloat {
        switch self {
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        }
    }
}

struct CircularProfileView: View {
    var user: User?
    let size: ProfileImageSize

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileView(user: User(id: NSUUID().uuidString, fullname: "Kali Katnip", email: "kat@gmail.com", username: "the_catonator", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/threads-ios-5b123.appspot.com/o/profile_images%2F7A34B18D-7FE5-4DE0-9FF7-41E6CB7C77AF?alt=media&token=1695cc97-dc4f-4171-8acf-3d6ecbd747ff"), size: .medium)
}




//        AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com:443/v0/b/threads-ios-5b123.appspot.com/o/profile_images%2F7A34B18D-7FE5-4DE0-9FF7-41E6CB7C77AF?alt=media&token=1695cc97-dc4f-4171-8acf-3d6ecbd747ff"))
//            .scaledToFit()
//            .frame(width: 40, height: 40)
//            .clipShape(Circle())

