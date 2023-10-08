//
//  ThreadItem.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI
import Firebase

struct ThreadCell: View {
    let thread: Thread

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                CircularProfileView(user: thread.user, size: .small)

                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(thread.user?.fullname ?? "")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(thread.timestamp.nanoseconds)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .bold()
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .padding(.vertical, 8)
                    .tint(.black)
                }
            }
            
            Divider()
        }
        .padding(12)
    }
}

#Preview {
    ThreadCell(thread: Thread(ownerUid: "something", caption: "Helo world", timestamp: Timestamp(seconds: 0, nanoseconds: 0), likes: 0))
}
