//
//  ProfileView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 18) {
                // User details
                ProfileHeaderView(user: user)

                // Follow button
                Button {
                    // Action
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 8))
                }

                // User content list view
                UserContentListView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: User(id: NSUUID().uuidString, fullname: "Kali Katnip", email: "kat@gmail.com", username: "the_catonator"))
}
