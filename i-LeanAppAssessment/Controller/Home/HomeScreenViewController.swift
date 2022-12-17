//
//  HomeScreenViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import UIKit

class HomeScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var objectOfNotificationViewMOdel = NotificationViewMOdel.objectOfViewModel
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    
    
    
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    var subName = ["kannada","english","hindi","science","maths","bio","chemistry"]
    var chapName = ["padya","chapter","shahiri","animals","intigration","cell","HCl"]
    var per = ["10%","20%","30%","40%","50%","60%","70%"]
    

    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var notificationIndicator: UILabel!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didloadChanges()
 
        didloadApiCall()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeScreenCollectionViewCell
        cell.image.image = imageis[indexPath.row]
        cell.subjectName.text = subName[indexPath.row]
        cell.chapterName.text = chapName[indexPath.row]
        cell.progressPercentage.text = per[indexPath.row]
        cell.contentBackgroundView.layer.masksToBounds = true
        cell.contentBackgroundView.layer.cornerRadius = 15.0
        
        return cell
    }
    
    @IBAction func notificationTapped(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 
}

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 273 , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


extension HomeScreenViewController{
    
    func didloadChanges()  {
        
        collectionView.isHidden = false
        
        searchField.borderStyle = .none
        notificationIndicator.layer.masksToBounds = true
        notificationIndicator.layer.cornerRadius = 3.5
        searchView.layer.cornerRadius = 14.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        userNameLabel.text = "Hi, \(objectOfSignInViewModel.userDetails.last?.userName.capitalized ?? "")"

        
    }
    
    
    func didloadApiCall() {
        
        let loader =   self.loader()
        
        objectOfNotificationViewMOdel.callApiFornotificationStatus(tokenToSend: objectOfSignInViewModel.userDetails.last?.token ?? ""){ status in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
                if status == true{
                    
                    self.notificationIndicator.isHidden = false

                }else{
                    
                    self.notificationIndicator.isHidden = true

                    
                }
            }
  
        }
        
    }
    
    
    func viewWillAppearChanges() {
        
        collectionView.isHidden = false
        
        searchField.borderStyle = .none
        notificationIndicator.layer.masksToBounds = true
        notificationIndicator.layer.cornerRadius = 3.5
        searchView.layer.cornerRadius = 14.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    
    
    
    func viewWillAppearApicall() {
        
        userNameLabel.text = "Hi, \(objectOfSignInViewModel.userDetails.last?.userName.capitalized ?? "")"
        
        let loader =   self.loader()
        
        objectOfNotificationViewMOdel.callApiFornotificationStatus(tokenToSend: objectOfSignInViewModel.userDetails.last?.token ?? ""){ status in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
                if status == true{
                    
                    self.notificationIndicator.isHidden = false

                }else{
                    
                    self.notificationIndicator.isHidden = true

                    
                }
            }
  
        }
        
        
    }
    
    
    
}
