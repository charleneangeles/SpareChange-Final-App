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
import Lottie

class DonationsViewController: UIViewController {
    @IBOutlet weak var donationLogo: UIImageView!
    @IBOutlet weak var txtDonation: UITextField!
    
    let apiClient = BTAPIClient(authorization: "sandbox_tgvrqw26_zv437twzv5ggtxvm")
    let userNodeRef = Database.database().reference().child("donations")

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func btnPay(_ sender: Any) {
        animation()
        
        showDropIn(clientTokenOrTokenizationKey: "sandbox_tgvrqw26_zv437twzv5ggtxvm")
       
        if let amount = txtDonation.text{

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
                }

        }

    }
    
    func animation(){
        let animationView = LOTAnimationView(name: "wallet_&_coin.json")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = 0.5
        animationView.loopAnimation = true
        
        view.addSubview(animationView)
        
        animationView.play()
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
