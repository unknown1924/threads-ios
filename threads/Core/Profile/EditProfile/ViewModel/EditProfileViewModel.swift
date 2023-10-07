//
//  EditProfileViewModel.swift
//  threads
//
//  Created by Debasis Mandal on 07/10/23.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    @Published var selecteItem: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?

    func updateUserData() async throws {
        print("DEBUG: update user data")
        try await updateProfileImage()
    }

    // load selected image from the photo picker
    @MainActor
    private func loadImage() async {
        guard let item = selecteItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }

    private func updateProfileImage() async throws {
        guard let image = uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
