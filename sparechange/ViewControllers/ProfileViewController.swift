//
//  ProfileViewController.swift
//  sparechange
//
//  Created by Charlene Angeles on 12/3/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let storageRef = Storage.storage().reference()
    let databaseRef = Database.database().reference()
    let userNodeRef = Database.database().reference().child("users")
    let userNodeRef2 = Database.database().reference().child("donations")
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var donationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
        let userId = Auth.auth().currentUser?.uid
        userNodeRef.child(userId!).observeSingleEvent(of: .value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any]
            {
                let name = dictionary["name"] as? String
                self.usernameLabel.text = "\(name!)"
            }
        })
        
        }
    
    @IBAction func uploadImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        saveChanges()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        logout()
    }
    func setupProfile(){
        profile_image.layer.cornerRadius = profile_image.frame.size.width/2
        profile_image.clipsToBounds = true
        
        let uid = Auth.auth().currentUser?.uid
        databaseRef.child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                if let dict = snapshot.value as? [String: AnyObject]
                {
                    self.usernameLabel.text = dict["username"] as? String
                    if let profileImageURL = dict["pic"] as? String
                    {
                        let url = URL(string: profileImageURL)
                        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                            if error != nil{
                                print(error!)
                                return
                            }
                            DispatchQueue.main.async {
                                self.profile_image?.image = UIImage(data: data!)
                            }
                        }).resume()
                    }
                }
            })
        
    }
    func logout(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "login")
        present(loginViewController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker{
            profile_image.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func saveChanges(){
        let imageName = NSUUID().uuidString
        
        let storedImage = storageRef.child("profile_images").child(imageName)
        
        if let uploadData = UIImagePNGRepresentation(self.profile_image.image!)
        {
            storedImage.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil{
                    print(error!)
                    return
                }
            storedImage.downloadURL(completion: { (url, error) in
                if error != nil{
                    print(error!)
                    return
                }
            if let urlText = url?.absoluteString{
                self.databaseRef.child("users").child((Auth.auth().currentUser?.uid)!).updateChildValues(["pic" : urlText], withCompletionBlock: { (error, ref) in
                        if error != nil{
                            print(error!)
                            return
                        }
                    })
                }
            })
            })
        }
    }
    
}
