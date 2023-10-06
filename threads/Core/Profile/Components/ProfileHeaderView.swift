//
//  ProfileHeaderView.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?

    init(user: User?) {
        self.user = user
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    // Full Name
                    Text(user?.fullname ?? "")
                        .font(.title)
                        .fontWeight(.semibold)

                    // User Name
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }

                if let bio = user?.bio {
                    // Description
                    //                                Text("I am the King of the Katniverse")
                    Text(bio)
                        .font(.footnote)
                }

                // Followers count
                Text("8 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            Spacer()
            CircularProfileView()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User(id: NSUUID().uuidString, fullname: "Kali Katnip", email: "kat@gmail.com", username: "the_catonator", bio: ""))
}
