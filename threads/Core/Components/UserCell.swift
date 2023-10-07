//
//  UserCell.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct UserCell: View {
    let user: User

    var body: some View {
        HStack(alignment: .top) {
            CircularProfileView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4))
                }

            //                                Button {
            //                                    // Action
            //                                } label: {
            //                                    Text("Follow")
            //                                        .font(.subheadline)
            //                                        .fontWeight(.semibold)
            //                                        .foregroundStyle(.white)
            //                                        .padding(.horizontal)
            //                                }
            //                                .buttonStyle(.bordered)
            //                                .background(.black)
            //                                .clipShape(.rect(cornerRadius: 10))

        }
        .padding(.horizontal)
    }
}

#Preview {
    // PreviewProvider is not working, check that later
    UserCell(user: User(id: NSUUID().uuidString, fullname: "Kali Katnip", email: "kat@gmail.com", username: "the_catonator"))
}
