//
//  ImagePicker.swift
//  nano
//
//  Created by Abeer on 13/06/1444 AH.
//

import SwiftUI
import UIKit
//import UIKit


struct ImagePicker: UIViewControllerRepresentable {
     
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->  UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
      //  imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
//    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        var parent: ImagePicker
//        init( parent: ImagePicker){
//            self.parent = parent
//        }
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didFinishPickerMediaWithInfo: [UIImagePickerController.InfoKey : Any]) {
//
//            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                parent.selectedImage = image
//            }
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
}

