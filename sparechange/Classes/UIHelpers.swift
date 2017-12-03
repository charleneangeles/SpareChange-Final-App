//
//  UIHelpers.swift
//  SpareChange
//
//  Created by Charlene Angeles on 10/24/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit
import Firebase

class UIHelpers: UIViewController {

    func showAlert(alertTitle: String, alertMessage: String, vc: UIViewController){
        
        let alertController = UIAlertController(title: alertTitle, message: (alertMessage), preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            (result: UIAlertAction) -> Void in print("OK")
        }
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
