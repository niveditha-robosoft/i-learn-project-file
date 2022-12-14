//
//  ViewController.swift
//  profile
//
//  Created by Harsha R Mundaragi on 09/12/22.
//

import UIKit

class ProfileEditViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    var objectOfProfileEditViewMOdel = ProfileEditViewMOdel.objectOfViewModel
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    @IBOutlet weak var chapterCompleted: UILabel!
    @IBOutlet weak var averageScore: UILabel!
    @IBOutlet weak var highestScore: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var image2View: UIView!
    @IBOutlet weak var profileIMage: UIImageView!
    
    var profileImageIs = #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws")
    var nameIs = ""
    var emailIs = ""
    var chapter = ""
    var highest = ""
    var average = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true

        didloadChanges()
  
    }


    @IBAction func selectImage(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        self.present(imageController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileIMage.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateEditButtonTapped(_ sender: UIButton) {
        
        let call = getToken()
        
        if call != ""{
          
            let loader =   self.loader()
            
            objectOfProfileEditViewMOdel.profileEditApicall(imageFile: profileIMage.image ?? #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws") , nameText: nameField.text ?? "", tokenToSend: call){ responseIs in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    
                    if responseIs == true{

                        self.navigationController?.popViewController(animated: true)

                    }else{
     
                    }
                }
       
            }
            
        }else{
            
        }

    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        backTwo()
    }
    
    
    func backTwo() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }

}

extension ProfileEditViewController{
    
    func didloadChanges()  {
        
        mailField.borderStyle = .none
        nameField.borderStyle = .none
        profileIMage.image = profileImageIs
        nameField.text = nameIs
        mailField.text = emailIs
        chapterCompleted.text = chapter
        averageScore.text = average
        highestScore.text = highest
        
        imageView.layer.cornerRadius = imageView.bounds.width/2
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor,UIColor.white.cgColor]
        gradientLayer.cornerRadius = gradientLayer.bounds.width / 2
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.insertSublayer(gradientLayer, at: 0)
        image2View.layer.cornerRadius = image2View.bounds.width / 2
        profileIMage.layer.cornerRadius = 60.0

        
    }
    
    
    
}


extension ProfileEditViewController{
    
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
                
        return receivedToken
    }
    
}
