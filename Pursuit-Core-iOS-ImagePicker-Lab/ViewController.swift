//
//  ViewController.swift
//  Pursuit-Core-iOS-ImagePicker-Lab
//
//  Created by Krystal Campbell on 10/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {
    
    var profileDetails: Profile!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var Outlet: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userNameSaved: UILabel!
    
   //  MARK: - Internal Properties
    

    // MARK: - IBActions
    
    @IBAction func addNewPhoto(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
    }
    
    func loadData(){
        do {
            profileDetails = try ProfilePersistenceHelper.manager.getProfiles()
        } catch {
            print(error)
        }
    }
//
//     func loadData(){
//            do {
//                sloths = try SlothPersistenceHelper.manager.getSloths()
//            } catch {
//                print(error)
//            }
//        }
//    }

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "UserName:"
        self.view.backgroundColor = .systemPink
    }
    
    // MARK: - Private methods
    
    // https://nshipster.com/image-resizing/
    func resized(image: UIImage, for size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}


// MARK: - UIImagePickerControllerDelegate

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        avatar.image = image
        dismiss(animated: true, completion: nil)
    }
}

