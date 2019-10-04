//
//  ViewController.swift
//  Pursuit-Core-iOS-ImagePicker-Lab
//
//  Created by Krystal Campbell on 10/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    // MARK: - Internal Properties
    
    var images = [UIImage]() {
        didSet {
            imagesCollectionView.reloadData()
            
        }
    }
    // MARK: - IBActions
    
    @IBAction func addNewPhoto(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
         imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
    }
    
    // MARK: - Private methods

    // https://nshipster.com/image-resizing/
    func resized(image: UIImage, for size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
}
extension ViewController: UICollectionViewDelegateFlowLayout {}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else {
            fatalError("Was expecting an ImageCollectionViewCell, but found a different type")
        }
        let image = images[indexPath.row]
        cell.imageView.image = resized(image: image, for: CGSize(width: 400, height: 400))
        cell.imageView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        images.append(image)
        dismiss(animated: true, completion: nil)
    }
}
