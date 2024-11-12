//
//  ImagePicker.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI
import UIKit
import CropViewController

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true) {
                if let image = info[.originalImage] as? UIImage {
                    self.showCropViewController(for: image)
                }
            }
        }

        private func showCropViewController(for image: UIImage) {
            let cropController = CropViewController(image: image)
            cropController.delegate = self
            cropController.aspectRatioPreset = .presetSquare // Set aspect ratio if needed
            cropController.aspectRatioLockEnabled = true
            cropController.resetAspectRatioEnabled = false

            if let topVC = UIApplication.shared.windows.first?.rootViewController {
                topVC.present(cropController, animated: true)
            }
        }

        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            parent.selectedImage = image
            cropViewController.dismiss(animated: true)
        }

        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            cropViewController.dismiss(animated: true)
        }
    }
}
