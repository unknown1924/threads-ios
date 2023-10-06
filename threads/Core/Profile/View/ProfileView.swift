//
//  ProfileView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation

    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
        //        return view.window.windowScene.screen.bounds / count - 20
    }

    var body: some View {
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    // User details
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                // Full Name
                                Text(viewModel.currentUser?.fullname ?? "King Kat")
                                    .font(.title)
                                    .fontWeight(.semibold)

                                // User Name
                                Text(viewModel.currentUser?.username ?? "the_catonator")
                                    .font(.subheadline)
                            }

                            if let bio = viewModel.currentUser?.bio {
                                // Description
                                Text("I am the King of the Katniverse")
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
                    
                    // Recent activity list
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .bold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "threads", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "replies", in: animation)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        
                        LazyVStack {
                            ForEach(0...10, id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
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
    ProfileView()
}
