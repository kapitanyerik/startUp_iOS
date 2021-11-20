//
//  ProfileInteractor.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 11. 08..
//

import SwiftUI
import FirebaseStorage
import Combine

class ProfileInteractor: ObservableObject {
    
    private let storage = Storage.storage().reference()
    
    @Published var profilePicture: Image? = nil
    
    static let instance = ProfileInteractor()
    
    private init() {}
    
    func uploadImage(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.2) {
            storage.child("profilePicture").putData(imageData, metadata: nil) { (_, error) in
                if let error = error {
                    print ("An error has occured during uploading profile picture: \(error.localizedDescription)")
                } else {
                    print ("Uploding profile picture was successful")
                }
            }
        } else {
            print ("An error has occured during getting profile picture's jpegData")
        }
    }
    
    func downloadImage() {
        storage.child("profilePicture").getData(maxSize: 1 * 1024 * 1024) { (imageData, error) in
            if let error = error {
                print("An error has occured during downloading profile picture: \(error.localizedDescription)")
            } else {
                if let imageData = imageData {
                    guard let uiImage = UIImage(data: imageData) else {
                        print ("An error has occured during converting image to UIImage")
                        return
                    }
                    self.profilePicture = Image(uiImage: uiImage)
                } else {
                    print ("An error has occured during getting profile picture's downloaded imageData")
                }
            }
        }
    }
}
