//
//  ViewController.swift
//  Profile
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var image2View: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.layer.cornerRadius = imageView.bounds.width/2
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor,UIColor.white.cgColor]
        gradientLayer.cornerRadius = gradientLayer.bounds.width / 2
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.insertSublayer(gradientLayer, at: 0)
 
        image2View.layer.cornerRadius = image2View.bounds.width / 2
        
    }

    

}

