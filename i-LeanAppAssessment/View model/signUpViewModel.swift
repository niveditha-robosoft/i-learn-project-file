//
//  signUpViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import Foundation

class SignUpViewModel {
    
    static var objectOfViewModel = SignUpViewModel()
    
    var objectOfSignUpApiNetwork = SignUpAndSignInApiNetwork()
    
    func ViewModelPostTheDataToApi(name: String, mobilenumber_Email: String, password: String, completion: @escaping((Bool) -> ())){
        
    objectOfSignUpApiNetwork.postTheSignUpDataToApi(nameToSend: name, mobilenumber_EmailToSend: mobilenumber_Email, passwordToSend: password){ completionData, completionError in
        
        DispatchQueue.main.async {
            
            
            if completionError == nil {
                
                if completionData == true{
                    
                    completion(true)
                }else{
                    
                    completion(false)
                }
               
                
                
                
            }
            else{
                
                
            }
        }
        
        
    }
        
    }
}
