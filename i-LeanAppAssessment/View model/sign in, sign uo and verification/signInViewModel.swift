//
//  signInViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 07/12/22.
//

import Foundation

class SignInViewModel {
    
    static var objectOfViewModel = SignInViewModel()
    
    var objectofSignUpAndSignInApiNetwork = SignUpAndSignInApiNetwork()
    
    func requestApiForSignIn(mobile_email: String, password: String, completion: @escaping((Bool) -> ())) {
        
        objectofSignUpAndSignInApiNetwork.postTheSignInDataToApi(mobilenumber_EmailToSend: mobile_email, passwordToSend: password){ completionData, completionError in
            
            if completionError == nil {
                
                if let data1 = completionData["token"]{
                    
                    print("")
                    print("")
                    print(")(*&^%$#@!#$%^&*()token",data1)
                    print("")
                    print("")
                    completion(true)
                    
                }
                
                if let data2 = completionData["error message"]{
                    
                    print("I am here ")
                    completion(false)
                }
            
            }
            else{

              

        }
            
        }
        
        
    }
    
}
