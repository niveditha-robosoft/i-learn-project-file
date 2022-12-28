//
//  HomeScreenViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import UIKit

class HomeScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
    
    var objectOfNotificationViewMOdel = NotificationViewMOdel.objectOfViewModel
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    var objectOfHomeViewModel = HomeViewModel.objectOfViewModel
     
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var notificationIndicator: UILabel!
    @IBOutlet weak var searchField: CustomeTextField!
    @IBOutlet weak var searchView: CustomSearchViewShadow!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var currentyStudyingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        ConfigureTapGesture()
        searchField.delegate = self
        didloadNameApiCall()

        didloadChanges()
 
        didloadNOtificationStatusApiCall()
        
        didLoadCurrentlyStudying()
        
        if navigationController?.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) ?? false {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }

        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        tabBarController?.tabBar.isHidden = false

        didloadNameApiCall()

        viewWillAppearApicall()
        
        didLoadCurrentlyStudying()
        
        viewWillAppearChanges()

        if navigationController?.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) ?? false {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectOfHomeViewModel.currentyStudyingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeScreenCollectionViewCell
        cell.image.image =  getImage(urlString: objectOfHomeViewModel.currentyStudyingData[indexPath.row].subject_image)
        cell.subjectName.text = objectOfHomeViewModel.currentyStudyingData[indexPath.row].subjectName.uppercased()
        cell.chapterName.text = objectOfHomeViewModel.currentyStudyingData[indexPath.row].chapterName
        cell.progressPercentage.text = "\(objectOfHomeViewModel.currentyStudyingData[indexPath.row].percentahge)%"
        cell.contentBackgroundView.layer.masksToBounds = true
        cell.contentBackgroundView.layer.cornerRadius = 15.0
        cell.contentBackgroundShadow()
        cell.progrssBar.progress = Float(objectOfHomeViewModel.currentyStudyingData[indexPath.row].percentahge)/Float(100)
        return cell
    }
    
    @IBAction func notificationTapped(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {

        searchApiCall()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchApiCall()
        searchField.endEditing(true)
        searchField.text = ""

        return true
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
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    func didloadNOtificationStatusApiCall() {
        let call = getToken()
        
        DispatchQueue.main.async {
            if call != ""{
                
                let loader = self.loader()
                
                
                self.objectOfNotificationViewMOdel.callApiFornotificationStatus(tokenToSend: call){ status in
                    
                    DispatchQueue.main.async() {
                        self.stopLoader(loader: loader)
                        if status == true{
                            
                            self.notificationIndicator.isHidden = false

                        }else{
                            
                            self.notificationIndicator.isHidden = true
                            
                        }
                    }
          
                }
                
            }else{
                
            }

        }
        
        
    }
    
    func didLoadCurrentlyStudying()  {
        
        DispatchQueue.main.async {
            let call = self.getToken()
            
            if call != ""{
                
                let loader =   self.loader()
                self.objectOfHomeViewModel.callApiForCurrentStudyingDetails(tokenToSend: call){ status in
                    
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

            }else{
                
            }
        }
        
 
    }
    
    
    func didloadNameApiCall() {
        
        let call = getToken()


        if call != ""{

            let loader =   self.loader()

            objectOfHomeViewModel.getUserName(tokenTosend: call){ status in

                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)

                if status == true{
                    self.userNameLabel.text = "Hi, \(self.objectOfHomeViewModel.userName.capitalized)"

                }else{
                    DispatchQueue.main.async {
                        let refreshAlert = UIAlertController(title: "ALERT", message: "Token expired pleace sign in again", preferredStyle: UIAlertController.Style.alert)

                                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in

                                    
                                    self.objectOfUserDefaults.set(1, forKey: "SignInStatus")
                                    
                                    self.navigationController?.popToRootViewController(animated: true)
                                    print("Handle Ok logic here")

                                }))



                                refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in

                                      print("Handle Cancel Logic here")

                                }))



                        self.present(refreshAlert, animated: true, completion: nil)
                    }

                }

                }
            }



        }else{

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
        
        DispatchQueue.main.async {
            let call = self.getToken()
            
            if call != ""{
                
                let loader =   self.loader()
                
                self.objectOfNotificationViewMOdel.callApiFornotificationStatus(tokenToSend: call){ status in
                    
                    DispatchQueue.main.async() {
                        self.stopLoader(loader: loader)
                        if status == true{
                            
                            self.notificationIndicator.isHidden = false

                        }else{
                            
                            self.notificationIndicator.isHidden = true

                        }
                    }
          
                }
                
                
            }else{
                
            }
        }
        
        
  
    }

    func searchApiCall()  {
        
        let loader = self.loader()
        objectOfHomeViewModel.searchForSubject(subjectName: searchField.text?.lowercased() ?? ""){ condition, dataIs in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
            if condition == true{
                
                let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "SubjectDetailsViewController") as? SubjectDetailsViewController
                
                if let vc = detailsVc {
                    
                    vc.x1 = 1
                    vc.subjectNameToSend = dataIs ?? ""
                    
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                
            }else{
                
                let noSearch = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as? SearchResultViewController
                
                if let vc = noSearch{
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }
            
        }
            
        }
 
        searchField.endEditing(true)

        searchField.text = ""

    }


    private func ConfigureTapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }
 
    
    @objc func handleTap(){

        view.endEditing(true)

    }
    
    func getImage(urlString: String) -> UIImage {
        
        guard let imageUrl = URL(string: urlString) else { return #imageLiteral(resourceName: "img_geography-1") }
        
        let imageData = try?
        Data(contentsOf: imageUrl)
        
        if let imageData = imageData{
            
            guard let image = UIImage(data: imageData) else { return #imageLiteral(resourceName: "img_geography-1") }
            
            return image
        }
        
        return #imageLiteral(resourceName: "img_geography")
        
    }
    
    func getToken() -> String {
        
        var id = ""
       let userIdIs = objectOfUserDefaults.value(forKey: "userId")
        
        if let idIs = userIdIs as? Int{
            
            id = String(idIs)
            
        }
        
        guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
            return ""}

        guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
            return ""}
        
        print("token",receivedToken)
        
        return receivedToken
    }
    
}

