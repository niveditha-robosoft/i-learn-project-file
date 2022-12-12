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
    @IBOutlet weak var edit_LogoutBackgroundView: UIView!
    @IBOutlet weak var edit_Logoutview: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var homeBackgroundView: UIView!
    
    @IBOutlet weak var bottomViewHeightCon: NSLayoutConstraint!
    @IBOutlet weak var bottimViewBottomCon: NSLayoutConstraint!
    @IBOutlet weak var bottomViewLeading: NSLayoutConstraint!
    @IBOutlet weak var bottomviewTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesBurron: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
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
        
        edit_LogoutBackgroundView.isHidden = true
        editButton.isEnabled = false
        logOutButton.isEnabled = false
        bottomView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bottomView.isHidden = true

    }
    

    @IBAction func edit_LogOutButtonTapped(_ sender: UIButton) {
        
        edit_LogoutBackgroundView.isHidden = false
        edit_Logoutview.layer.cornerRadius = 16.0
        editButton.isEnabled = true
        logOutButton.isEnabled = true
        bottomView.isHidden = true
    }
    

    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        
        
        
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        
        
        
        bottomView.isHidden = false
        
        noButton.layer.cornerRadius = 10.0
        noButton.layer.borderWidth = 2.0
        noButton.layer.borderColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        yesBurron.layer.cornerRadius = 10.0
        bottomView.layer.cornerRadius = 15.0
       
        edit_LogoutBackgroundView.isHidden = true
//        homeBackgroundView.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomViewHeightCon.constant = 312
            self.view.layoutIfNeeded()
        }) { (status) in
//            hu
        }
        
        
    }
    
    
    @IBAction func OnTapHideView(_ sender: Any) {
        
        edit_LogoutBackgroundView.isHidden = true
        editButton.isEnabled = false
        logOutButton.isEnabled = false
        
        
    }
    
    
    
}

