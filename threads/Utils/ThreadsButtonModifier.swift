//
//  ThreadsButtonModifier.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct ThreadsButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width:  352, height: 44)
            .background(.black)
            .clipShape(.rect(cornerRadius: 10))
    }
}
