//
//  ExploreView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(1...10, id: \.self) { _ in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
