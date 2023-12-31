//
//  UserContentListView.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import SwiftUI
import Firebase

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation

    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }

    var body: some View {
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
                    ThreadCell(thread: Thread(ownerUid: "something", caption: "Helo world", timestamp: Timestamp(seconds: 40, nanoseconds: 20), likes: 0))
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}

