//
//  ProfileViewModel.swift
//  threads
//
//  Created by Debasis Mandal on 06/10/23.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
//            print("DEBUG: User in viewmodel from combine is \(user)")
        }.store(in: &cancellables)
    }
}
