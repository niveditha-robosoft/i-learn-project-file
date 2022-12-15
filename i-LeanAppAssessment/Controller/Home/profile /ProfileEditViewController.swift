//
//  ViewController.swift
//  profile
//
//  Created by Harsha R Mundaragi on 09/12/22.
//

import UIKit

class ProfileEditViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    var objectOfProfileEditViewMOdel = ProfileEditViewMOdel.objectOfViewModel
    
    
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var image2View: UIView!
    
    @IBOutlet weak var profileIMage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mailField.borderStyle = .none
        nameField.borderStyle = .none
        
        imageView.layer.cornerRadius = imageView.bounds.width/2
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor,UIColor.white.cgColor]
        gradientLayer.cornerRadius = gradientLayer.bounds.width / 2
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.insertSublayer(gradientLayer, at: 0)
        profileIMage.layer.cornerRadius = 60.0
        image2View.layer.cornerRadius = image2View.bounds.width / 2
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
        
        
        
        
        objectOfProfileEditViewMOdel.profileEditApicall(imageFile: profileIMage.image ?? #imageLiteral(resourceName: "img_pp") , nameText: nameField.text ?? "")
        
        
        
        
        
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
//        self.navigationController?.popViewController(animated: true)
        backTwo()
    }
    
    
    func backTwo() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }
    
}

