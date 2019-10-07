//
//  ViewController.swift
//  Pursuit-Core-iOS-ImagePicker-Lab
//
//  Created by Krystal Campbell on 10/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userNameLabel: UILabel!
    // MARK: - Internal Properties
    
    //    var images = [UIImage]() {
    //        didSet {
    //            imagesCollectionView.reloadData()
    //
    //        }
    //    }
    // MARK: - IBActions
    
    @IBAction func addNewPhoto(_ sender: Any) {
//        let imagePickerVC = UIImagePickerController()
//        imagePickerVC.delegate = self
//        present(imagePickerVC, animated: true)
    }
    
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "UserName"
        self.view.backgroundColor = .systemPink
    }
    
    // MARK: - Private methods
    
//    // https://nshipster.com/image-resizing/
//    func resized(image: UIImage, for size: CGSize) -> UIImage {
//        let renderer = UIGraphicsImageRenderer(size: size)
//        return renderer.image { (context) in
//            image.draw(in: CGRect(origin: .zero, size: size))
//        }
//    }
//
    // MARK: - UICollectionViewDelegateFlowLayout
}

// MARK: - UICollectionViewDataSource



// MARK: - UIImagePickerControllerDelegate

//extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
//            return
//        }
//        images.append(image)
//        dismiss(animated: true, completion: nil)
//    }
//}
