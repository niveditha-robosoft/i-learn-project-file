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
    
    var userDetails = [UserDataModel]()
    
    func requestApiForSignIn(mobile_email: String, password: String, completion: @escaping((Bool) -> ())) {
        
        objectofSignUpAndSignInApiNetwork.postTheSignInDataToApi(mobilenumber_EmailToSend: mobile_email, passwordToSend: password){ completionData, completionBool, completionError in
            
            if completionError == nil {
                
                if completionBool == true{
                   
                    
                    guard let data1 = completionData["token"] as? String else{ return}
                    guard let data2 = completionData["name"] as? String else{ return}
                    guard let data3 = completionData["userId"] as? Int else{ return}
                    
                    print("token is : \(data1)\nname is : \(data2)\nid is : \(data3)")
                    
                    let user = UserDataModel(userName: data2, userId: data3, token: data1)
                    
                    self.userDetails.append(user)
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
