//
//  varificationNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 08/12/22.
//

import Foundation
class VarificationNetwork {
    

    
    func apiCallForVarificationCode(sendDataToApi: String, completion: @escaping((Bool, Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/account-verify") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        print("otp email : \(sendDataToApi)")
        request.httpMethod = "GET"
        
        request.setValue(sendDataToApi, forHTTPHeaderField: "source")
        
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("send otp responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let data1 = responsData as? [String: Any]{
                                
                                print("Send otp data : ",data1)

                                completion(true,nil)
                            }
                            
                            
                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        completion(false,nil)
                    }

                }
 
            })
            
            task.resume()
  
    }
    
    
    func varifyTheOtp(sendmobile_email: String, sendOtp: Int, completion: @escaping((Bool, Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/otp-verify") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"

        request.setValue(sendmobile_email, forHTTPHeaderField: "source")
        request.setValue(String(sendOtp), forHTTPHeaderField: "sentOtp")

    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [String: Any]{
                                
                                completion(true,nil)
                                print("Varify otp data : ",data1)

                            }
                            
                        }
                    }else if responsIs.statusCode == 400{
                        
                        completion(false,error)
                        
                    }else{
                        completion(false,error)
                        print("Varify error Responce Error is: ", error?.localizedDescription ?? "Error...!")
                    }

                }
 
            })
            
            task.resume()
        
    }
    
    
    func createNewPassword(sendmobile_email: String, newPasswordToApi: String, completion: @escaping((Bool, Error?) -> ())) {

        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/reset-password") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"

        request.setValue(sendmobile_email, forHTTPHeaderField: "source")
        request.setValue(newPasswordToApi, forHTTPHeaderField: "newPassword")
 
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Create password responce : ",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [String: Any]{
                                
                                completion(true,nil)
                                print("create password data : ",data1)

                            }
                            
                        }
                    }else if responsIs.statusCode == 400{
                        
                        completion(false,nil)

                    }else{
                        completion(false,error)
                        print("Create pass word Responce Error is: ", error?.localizedDescription ?? "Error...!")
                    }

                }
 
            })
            
            task.resume()
        
    }
    
    
}
