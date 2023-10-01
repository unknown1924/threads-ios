//
//  FeedView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(1...10, id: \.self) { _ in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                print("refresh")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button  {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
