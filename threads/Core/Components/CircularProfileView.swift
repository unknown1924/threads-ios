//
//  CircularProfileVIew.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct CircularProfileView: View {
    var body: some View {
        Image("dog")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileView()
}
