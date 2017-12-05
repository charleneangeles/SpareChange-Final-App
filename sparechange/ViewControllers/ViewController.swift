//
//  ViewController1.swift
//  sparechange
//
//  Created by Charlene Angeles on 12/4/17.
//  Copyright © 2017 charangeles. All rights reserved.
//
import UIKit
import Lottie
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LOTAnimationView(name: "atm_link")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = 0.5
        view.addSubview(animationView)
        
        animationView.play()
    }
       
        
    }




