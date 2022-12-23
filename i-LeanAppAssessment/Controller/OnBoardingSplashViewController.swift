//
//  OnBoardingSplashViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 22/12/22.
//

import UIKit

class OnBoardingSplashViewController: UIViewController {

    var userHelp = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        var value = 0
        let valueIs = userHelp.value(forKey: "Status")
        
        if let value1 = valueIs as? Int{
            
            value = value1
        }
        
        
        if value == 3{
            
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
            
            if let vc = signInPage{
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
   
        } else if value == 1 || value  == 2{
            
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
            
            if let vc = signInPage{
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }else{
            
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardingOneViewController") as? OnBoardingOneViewController
            
            if let vc = signInPage{
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            
  
        }
 
    }
    


}
