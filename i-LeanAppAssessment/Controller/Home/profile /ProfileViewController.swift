//
//  ViewController.swift
//  Profile
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    var objectOfProfileViewMOdel = ProfileViewMOdel.objectOfViewMOdel
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMailId: UILabel!
    @IBOutlet weak var chapterCompleted: UILabel!
    @IBOutlet weak var averageScore: UILabel!
    @IBOutlet weak var highestScore: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var image2View: UIView!
    @IBOutlet weak var edit_LogoutBackgroundView: UIView!
    @IBOutlet weak var edit_Logoutview: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var homeBackgroundView: UIView!

    @IBOutlet weak var bottomViewHeightCon: NSLayoutConstraint!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesBurron: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader =   self.loader()
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    self.stopLoader(loader: loader)
                }
 
        // Do any additional setup after loading the view.
        imageView.layer.cornerRadius = imageView.bounds.width/2
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor,UIColor.white.cgColor]
        gradientLayer.cornerRadius = gradientLayer.bounds.width / 2
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.insertSublayer(gradientLayer, at: 0)
 
        image2View.layer.cornerRadius = image2View.bounds.width / 2
        
        profileImage.layer.cornerRadius = 60.0
        edit_LogoutBackgroundView.isHidden = true
        editButton.isEnabled = false
        logOutButton.isEnabled = false
        bottomView.isHidden = false
        noButton.isHidden = true
        noButton.isEnabled = false
        yesBurron.isEnabled = false
        yesBurron.isHidden = true
        self.bottomViewHeightCon.constant = 0
        
        objectOfProfileViewMOdel.callApiForUSerProfileData(tokenToSend: objectOfSignInViewModel.userDetails[0].token){ responce in
            
            if responce == true{
                
                self.userName.text = self.objectOfProfileViewMOdel.profileData.last?.name.capitalized
                self.userMailId.text = self.objectOfProfileViewMOdel.profileData.last?.email
                self.chapterCompleted.text = String(self.objectOfProfileViewMOdel.profileData.last?.chapter ?? 0)
                self.averageScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.average ?? 0)
                self.highestScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.highest ?? 0)
                
            }
            
            
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bottomView.isHidden = true
//        self.tabBarController?.tabBar.isHidden = false

        imageView.layer.cornerRadius = imageView.bounds.width/2
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor,UIColor.white.cgColor]
        gradientLayer.cornerRadius = gradientLayer.bounds.width / 2
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.insertSublayer(gradientLayer, at: 0)
 
        image2View.layer.cornerRadius = image2View.bounds.width / 2
        
        profileImage.layer.cornerRadius = 60.0
        edit_LogoutBackgroundView.isHidden = true
        editButton.isEnabled = false
        logOutButton.isEnabled = false
        bottomView.isHidden = false
        noButton.isHidden = true
        noButton.isEnabled = false
        yesBurron.isEnabled = false
        yesBurron.isHidden = true
        self.bottomViewHeightCon.constant = 0

        
        objectOfProfileViewMOdel.callApiForUSerProfileData(tokenToSend: objectOfSignInViewModel.userDetails[0].token){ responce in
            
            if responce == true{
                
                self.userName.text = self.objectOfProfileViewMOdel.profileData.last?.name.capitalized
                self.userMailId.text = self.objectOfProfileViewMOdel.profileData.last?.email
                self.chapterCompleted.text = String(self.objectOfProfileViewMOdel.profileData.last?.chapter ?? 0)
                self.averageScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.average ?? 0)
                self.highestScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.highest ?? 0)
                
            }

        }
    }
    

    @IBAction func edit_LogOutButtonTapped(_ sender: UIButton) {

        edit_LogoutBackgroundView.isHidden = false
        edit_Logoutview.layer.cornerRadius = 16.0
        editButton.isEnabled = true
        logOutButton.isEnabled = true
        bottomView.isHidden = true
    }
    

    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        
        let editVc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController
        
        if let vc = editVc{
            
            vc.nameIs = userName.text ?? ""
            vc.emailIs = userMailId.text ?? ""
            vc.average = averageScore.text ?? ""
            vc.highest = highestScore.text ?? ""
            vc.chapter = chapterCompleted.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {

        bottomView.isHidden = false
        
        noButton.layer.cornerRadius = 10.0
        noButton.layer.borderWidth = 2.0
        noButton.layer.borderColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        yesBurron.layer.cornerRadius = 10.0
        bottomView.layer.cornerRadius = 15.0
       
        edit_LogoutBackgroundView.isHidden = true
        homeBackgroundView.backgroundColor = UIColor(red: 147/255, green: 150/255, blue: 153/255, alpha: 1.0)
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
    
    @IBAction func tappedOnScrollView(_ sender: Any) {
        
        bottomView.isHidden = true
       
        edit_LogoutBackgroundView.isHidden = true
        homeBackgroundView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        
    }
    
    
}

