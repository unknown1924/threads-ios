//
//  ProfileThreadFilter.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { self.rawValue }
}
