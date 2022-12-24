//
//  OnBoardingSplashViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 22/12/22.
//

import UIKit

class OnBoardingSplashViewController: UIViewController {

    var userHelp = UserDefaults()
    var objectOfKeyChain = KeyChain()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        
        var id = ""
       let userIdIs = userHelp.value(forKey: "userId")
        
        if let idIs = userIdIs as? Int{
            
            id = String(idIs)
            
        }
        print("stored user id : \(id)")

        var receivedTokenIs = ""
        
        if let receivedTokenData = objectOfKeyChain.loadData(userId: id){
            
            if let receivedToken = String(data: receivedTokenData, encoding: .utf8){
                
                receivedTokenIs = receivedToken
            }
        }
        
        
        print("token",receivedTokenIs)
        
        if receivedTokenIs != ""{
            
            let homeVc: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let homePage = homeVc.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
            
            if let vc = homePage {
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            
        } else{
           
            var value = 0
            
            if let value1 = userHelp.value(forKey: "Status") as? Int{
                
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
        
        
        
        
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        var value2 = 0
        var value02 = 0
        
        if let value0 = userHelp.value(forKey: "SignOutYes") as? Int{
            
            value2 = value0
        }
        
        if let value = userHelp.value(forKey: "SignInStatus") as? Int{

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
