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
    var objectOfHomeViewModel = HomeViewModel.objectOfViewModel
 
    var x = 0
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var notificationIndicator: UILabel!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var currentyStudyingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("^^^^^^^^^^^^^^^^",x)
        didloadNameApiCall()

        didloadChanges()
 
//        didloadNOtificationStatusApiCall()
        
        didLoadCurrentlyStudying()
        

        
        
    }
    
    /*
    
//    func save() {
//        do{
//            
//            try KeyChainManagesr.saveData(userId: "i23", userToken: "naanu".data(using: .utf8) ?? Data())
//        }
//        catch{
//            
//            print(error)
//            
//        }
//    }
//    
//    func getIt() {
//         
//        guard let data =  KeyChainManagesr.getData(userId: "i23") else{
//            
//            print("Failed to read password")
//            
//            return
//            
//        }
//        
//        
//        let tokenIs = String(decoding: data, as: UTF8.self)
//        
//        print("Getted data : \(tokenIs)")
//        
//    }
//    
   
    */
    override func viewDidAppear(_ animated: Bool) {
        
        viewWillAppearApicall()
        
        didLoadCurrentlyStudying()
        
        didloadNameApiCall()
        
        viewWillAppearChanges()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectOfHomeViewModel.currentyStudyingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeScreenCollectionViewCell
        cell.image.image = imageis[indexPath.row]
        cell.subjectName.text = objectOfHomeViewModel.currentyStudyingData[indexPath.row].subjectName.uppercased()
        cell.chapterName.text = objectOfHomeViewModel.currentyStudyingData[indexPath.row].chapterName
        cell.progressPercentage.text = "\(objectOfHomeViewModel.currentyStudyingData[indexPath.row].percentahge)%"
        cell.contentBackgroundView.layer.masksToBounds = true
        cell.contentBackgroundView.layer.cornerRadius = 15.0
        cell.progrssBar.progress = Float(objectOfHomeViewModel.currentyStudyingData[indexPath.row].percentahge)/Float(100)
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
        
        collectionView.isHidden = true
        currentyStudyingLabel.isHidden = true
        searchField.borderStyle = .none
        notificationIndicator.layer.masksToBounds = true
        notificationIndicator.layer.cornerRadius = 3.5
        searchView.layer.cornerRadius = 14.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

        
    }
    
    
    func didloadNOtificationStatusApiCall() {
        
        let loader =   self.loader()
        
        print("STTUS ID : \(objectOfSignInViewModel.userDetails.last?.token ?? "")")
        
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
    
    func didLoadCurrentlyStudying()  {
        
        let loader =   self.loader()
        objectOfHomeViewModel.callApiForCurrentStudyingDetails(tokenToSend: objectOfSignInViewModel.userDetails.last?.token ?? ""){ status in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
            if status == true{
                
                self.collectionView.isHidden = false
                self.currentyStudyingLabel.isHidden = false
                self.collectionView.reloadData()
                
            }else{
                
                self.collectionView.isHidden = true
                self.currentyStudyingLabel.isHidden = true
                
                
            }
            
            }
            
        }
        
    }
    
    
    func didloadNameApiCall() {
        
        let loader =   self.loader()

        objectOfHomeViewModel.getUserName(tokenTosend: objectOfSignInViewModel.userDetails.last?.token ?? ""){ status in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
            
            if status == true{
                self.userNameLabel.text = "Hi, \(self.objectOfHomeViewModel.userName)"
                
            }else{
                
                
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
