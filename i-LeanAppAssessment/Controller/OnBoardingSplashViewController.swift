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
   
        } else if value == 1 || value  == 2 || value == 4{
            
            
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        var value2 = 0
        var value02 = 0
        
        let signOutData = userHelp.value(forKey: "SignOutYes")
        let signInIs = userHelp.value(forKey: "SignInStatus")

        if let value0 = signOutData as? Int{
            
            value2 = value0
        }
        
        if let value = signInIs as? Int{

            value02 = value
        }
        
        print("Hi Hi load")
        
        if value2 == 1{
            
            print("Hi Hi load 1")
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
            
            if let vc = signInPage{
                
                print("Hi Hi load 2")
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
        
        userHelp.set(0, forKey: "SignOutYes")
        
        
        if value02 == 1 {

            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController

            if let vc = signInPage{

                print("Hi Hi load sign in ")
                self.navigationController?.pushViewController(vc, animated: true)

            }
        }
    }
    


}
