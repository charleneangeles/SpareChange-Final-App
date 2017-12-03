//
//  RegisterNewViewController.swift
//  sparechange
//
//  Created by Charlene Angeles on 11/29/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit
import Firebase

class RegisterNewViewController: UIViewController {
    
    let userNodeRef = Database.database().reference().child("users")
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        if let email = txtEmail.text, let password = txtPassword.text, let name = txtName.text{
            
            Auth.auth().createUser(withEmail: email, password: password) {(user, error) in
                if user != nil{
                
                    let userValues = ["name": name, "email": email]
                    self.userNodeRef.child((user?.uid)!).updateChildValues(userValues, withCompletionBlock: {(userDBError, userDBRef) in
                        
                        if userDBError != nil{
                            
                            let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                            
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                                (result : UIAlertAction) -> Void in print("OK")
                            }
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    })
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in print("OK")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
}



