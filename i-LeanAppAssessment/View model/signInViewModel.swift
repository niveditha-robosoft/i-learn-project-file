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
    
    var objectOfUserDefault = UserDefaults()
    
    func requestApiForSignIn(mobile_email: String, password: String, completion: @escaping((Bool,Int) -> ())) {
        
        objectofSignUpAndSignInApiNetwork.postTheSignInDataToApi(mobilenumber_EmailToSend: mobile_email, passwordToSend: password){ completionData, completionBool, completionError in
            
            if completionError == nil {
                
                if completionBool == true{
                   
                    if let data0 = completionData{
                        
                        guard let data1 = data0["token"] as? String else{ return}
                        guard let data2 = data0["name"] as? String else{ return}
                        guard let data3 = data0["userId"] as? Int else{ return}
                        
                        let objectOfKeyChain = KeyChain()
                        objectOfKeyChain.deletePassword(userId: String(data3))
                        objectOfKeyChain.saveData(userId: String(data3), data: data1.data(using: .utf8) ?? Data())
                        self.objectOfUserDefault.setValue(data3, forKeyPath: "userId")
                        
                        self.objectOfUserDefault.set(0, forKey: "Status")
                        
                        print("")
                        print("userId : \(data3)")
                        print("user Token : \(data1)")
                        print("")

                        let user = UserDataModel(userName: data2, userId: data3, token: data1)
                        
                        self.userDetails.append(user)
                    }

                    completion(true,0)
                    
                }else{
                    
                    completion(false,0)

                }

            }
            else{
                completion(false,1)
        }
   
        } 
   
    }
    
}
