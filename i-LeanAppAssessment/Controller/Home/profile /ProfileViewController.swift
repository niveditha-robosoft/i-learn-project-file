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
    
    
    @IBOutlet weak var chapterView: UIView!
    @IBOutlet weak var averageVIew: UIView!
    @IBOutlet weak var highestView: UIView!
    
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
        
        navigationController?.navigationBar.isHidden = true
        didloadChanges()
        
        didLoadApiCall()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tabBarController?.tabBar.isHidden = false

        viewWillwApperChanges()
        
        viewWillAppeareApiCall()
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//
//        tabBarController?.tabBar.isHidden = false
//
//        viewWillwApperChanges()
//
//        viewWillAppeareApiCall()
//    }

    @IBAction func edit_LogOutButtonTapped(_ sender: UIButton) {

        edit_LogoutBackgroundView.isHidden = false
        edit_Logoutview.layer.cornerRadius = 16.0
        editButton.isEnabled = true
        logOutButton.isEnabled = true
        bottomView.isHidden = true

    }
    

    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        
        print("HI edit is here...!")
        
        
        let editVc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController
        
        if let vc = editVc{
            
            vc.nameIs = userName.text ?? ""
            vc.emailIs = userMailId.text ?? ""
            vc.average = averageScore.text ?? ""
            vc.highest = highestScore.text ?? ""
            vc.chapter = chapterCompleted.text ?? ""
            vc.profileImageIs = profileImage.image ?? #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {

        tabBarController?.tabBar.isHidden = true

        bottomView.isHidden = false
        
        noButton.layer.cornerRadius = 10.0
        noButton.layer.borderWidth = 2.0
        noButton.layer.borderColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        yesBurron.layer.cornerRadius = 10.0
        bottomView.layer.cornerRadius = 15.0
        
        noButton.isHidden = false
        yesBurron.isHidden = false
        noButton.isEnabled = true
        yesBurron.isEnabled = true
       
        edit_LogoutBackgroundView.isHidden = true
//        homeBackgroundView.backgroundColor = UIColor(red: 147/255, green: 150/255, blue: 153/255, alpha: 1.0)
        homeBackgroundView.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.5882352941, blue: 0.6, alpha: 0.3377836045)
        chapterView.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.5882352941, blue: 0.6, alpha: 0.3377836045)
        averageVIew.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.5882352941, blue: 0.6, alpha: 0.3377836045)
        highestView.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.5882352941, blue: 0.6, alpha: 0.3377836045)
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomViewHeightCon.constant = 312
            self.view.layoutIfNeeded()
        }) { (status) in
            
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
//        homeBackgroundView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        homeBackgroundView.backgroundColor = #colorLiteral(red: 0.9641161561, green: 0.9801463485, blue: 1, alpha: 1)
        chapterView.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        averageVIew.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        highestView.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        tabBarController?.tabBar.isHidden = false

    }
    
    @IBAction func goToResultScreen(_ sender: UIButton) {
        
        let resultVc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController
        
        if let vc = resultVc{
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func signOutNOButtonTapped(_ sender: UIButton) {
        
        
        bottomView.isHidden = true
       
        edit_LogoutBackgroundView.isHidden = true
//        homeBackgroundView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        homeBackgroundView.backgroundColor = #colorLiteral(red: 0.9641161561, green: 0.9801463485, blue: 1, alpha: 1)
        chapterView.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        averageVIew.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        highestView.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        
        
        print("NOOOOOOOOOOOOOOOOOOOOOOOOOOOO")
        
        
    }
    
    @IBAction func signOutYesButtonTapped(_ sender: UIButton) {
        
        
        print("Yessssssssssssssssssss")
    }
    
    
}


extension ProfileViewController{
    
    func didloadChanges() {
        
        highestView.layer.cornerRadius = 9.0
        averageVIew.layer.cornerRadius = 9.0
        chapterView.layer.cornerRadius = 9.0
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
        
    }
    
    func didLoadApiCall() {
        
        if objectOfSignInViewModel.userDetails.last?.token != nil {
            
            let loader =   self.loader()
            
            objectOfProfileViewMOdel.callApiForUSerProfileData(tokenToSend: objectOfSignInViewModel.userDetails.last?.token ?? ""){ responce in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    
                    if responce == true{
                        
                        self.userName.text = self.objectOfProfileViewMOdel.profileData.last?.name.capitalized
                        self.userMailId.text = self.objectOfProfileViewMOdel.profileData.last?.email
                        self.profileImage.image = self.getImage(urlString: self.objectOfProfileViewMOdel.profileData.last?.profileIMage ?? "")
                        self.chapterCompleted.text = String(self.objectOfProfileViewMOdel.profileData.last?.chapter ?? 0)
                        self.averageScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.average ?? 0)
                        self.highestScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.highest ?? 0)
                        
                    }else{
                        
                        
                    }
                }

            }
            
        }else{
            
            
        }
        
        
   
    }
    
    
    func getImage(urlString: String) -> UIImage {
        
        guard let imageUrl = URL(string: urlString) else { return #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws") }
        
        let imageData = try?
        Data(contentsOf: imageUrl)
        
        if let imageData = imageData{
            
            guard let image = UIImage(data: imageData) else { return #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws") }
            
            return image
        }
        
        return #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws")
        
    }
    
    
    
    func viewWillwApperChanges() {
        
        highestView.layer.cornerRadius = 9.0
        averageVIew.layer.cornerRadius = 9.0
        chapterView.layer.cornerRadius = 9.0
        bottomView.isHidden = true
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
        
        
    }
    
    
    func viewWillAppeareApiCall() {
        
        if objectOfSignInViewModel.userDetails.last?.token != nil{
            
            
            let loader = self.loader()
            
            objectOfProfileViewMOdel.callApiForUSerProfileData(tokenToSend: objectOfSignInViewModel.userDetails.last?.token ?? ""){ responce in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    if responce == true{
                        
                        self.userName.text = self.objectOfProfileViewMOdel.profileData.last?.name.capitalized
                        self.userMailId.text = self.objectOfProfileViewMOdel.profileData.last?.email
                        self.profileImage.image = self.getImage(urlString: self.objectOfProfileViewMOdel.profileData.last?.profileIMage ?? "")
                        self.chapterCompleted.text = String(self.objectOfProfileViewMOdel.profileData.last?.chapter ?? 0)
                        self.averageScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.average ?? 0)
                        self.highestScore.text = String(self.objectOfProfileViewMOdel.profileData.last?.highest ?? 0)
                        
                    }else{
                        
                    }
                }

            }
            
        }else{
            
            
        }
        
        
  
    }
    
}
