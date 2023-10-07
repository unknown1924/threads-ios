//
//  ImageUploader.swift
//  threads
//
//  Created by Debasis Mandal on 07/10/23.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.001) else { return nil }

        let filename = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")

        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload profile image with error \(error.localizedDescription)")
            return nil
        }
    }
}
