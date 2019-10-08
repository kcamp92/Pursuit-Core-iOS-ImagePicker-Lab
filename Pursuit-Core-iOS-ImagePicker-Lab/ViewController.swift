//
//  ViewController.swift
//  Pursuit-Core-iOS-ImagePicker-Lab
//
//  Created by Krystal Campbell on 10/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {
    
 var newUserProfile = [Profile]()
    
    var imageSaved = Data() {
        didSet {
      
        }
    }
    
    var usernameEntered = "" {
        didSet{
            try? ProfilePersistenceHelper.manager.save(newProfile: )
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameSaved: UILabel!
    
    //  MARK: - Internal Properties
    let newUser = Profile.init(username: "", image: Data())
    
    // MARK: - IBActions
    
    @IBAction func addNewPhoto(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
      
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
        
        DispatchQueue.global(qos: .utility).async {
            try? ProfilePersistenceHelper.manager.save(newProfile: self.newUser)
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
        func loadData(){
            do {
                newUserProfile = try ProfilePersistenceHelper.manager.getProfiles()
                
            } catch {
                print(error)
            }
        }
    
    
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
        imageSaved = image.pngData()!
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - TextFieldDelegate

extension ImagePickerViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return false
        }
        let range = Range(range, in: text)!
        let newText = text.replacingCharacters(in: range, with: string)
        usernameEntered = newText
        return true
    }
}


