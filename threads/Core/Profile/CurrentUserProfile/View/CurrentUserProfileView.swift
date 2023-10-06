//
//  CurrentUserProfileView.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State var showEditProfile = false

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    // User details
                    ProfileHeaderView(user: viewModel.currentUser)

                    // Follow button
                    HStack {
                        Button {
                            showEditProfile.toggle()
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .frame(width: 174, height: 32)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 8))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4))
                                }
                        }

                        Button {
                            // Action
                        } label: {
                            Text("Share Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .frame(width: 174, height: 32)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 8))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4))
                                }
                        }
                    }

                    // Recent activity list
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfile) {
                EditProfileView()
                    .environmentObject(viewModel)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        //                        Image(systemName: "line.3.horizontal")
                        Image(systemName: "power.circle")
                            .tint(.black)
                    }
                }
            }
            .padding(.horizontal)
        }

    }
}

#Preview {
    CurrentUserProfileView()
}
