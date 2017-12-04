//
//  DonationsViewController.swift
//  sparechange
//
//  Created by Charlene Angeles on 12/3/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit
import Firebase
import Braintree
import BraintreeDropIn

class DonationsViewController: UIViewController {
    @IBOutlet weak var donationLogo: UIImageView!
    @IBOutlet weak var txtDonation: UITextField!
    
    let apiClient = BTAPIClient(authorization: "sandbox_tgvrqw26_zv437twzv5ggtxvm")
    let userNodeRef = Database.database().reference().child("donations")

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPay(_ sender: Any) {
        showDropIn(clientTokenOrTokenizationKey: "sandbox_tgvrqw26_zv437twzv5ggtxvm")
       
        if let amount = txtDonation.text{
            
            
//            userNodeRef.child(Auth.auth().currentUser.uid)
//                .createDonation(withAmount: amount) {(user, error) in
            let user = Auth.auth().currentUser
                if user != nil{
                    
                    let donationValues = ["amount": [amount]]
                    self.userNodeRef.child((user?.uid)!).updateChildValues(donationValues, withCompletionBlock: {(error, userDBRef) in
                        
                        if error != nil{
                            
                            let alertController = UIAlertController(title: "Error!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                            
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                                (result : UIAlertAction) -> Void in print("OK")
                            }
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    })
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab")
//                    self.present(vc!, animated: true, completion: nil)
                }
                else{
//                    let alertController = UIAlertController(title: "Error", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
//
//                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
//                        (result : UIAlertAction) -> Void in print("OK")
//                    }
//                    alertController.addAction(okAction)
//                    self.present(alertController, animated: true, completion: nil)
                }
//            }
        }
    }
    
    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
        { (controller, result, error) in
            if (error != nil) {
                print("ERROR")
            } else if (result?.isCancelled == true) {
                print("CANCELLED")
            } else if let result = result {
                // Use the BTDropInResult properties to update your UI
                //result.paymentOptionType
                // result.paymentMethod
                // result.paymentIcon
                // result.paymentDescription
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)
    }
    

}
