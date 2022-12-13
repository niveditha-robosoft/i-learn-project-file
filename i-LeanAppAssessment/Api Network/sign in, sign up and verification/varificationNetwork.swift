//
//  varificationNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 08/12/22.
//

import Foundation
class VarificationNetwork {
    

    
    func apiCallForVarificationCode(sendDataToApi: String, completion: @escaping((Bool, Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/forgot") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        request.setValue(sendDataToApi, forHTTPHeaderField: "source")
        
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(error?.localizedDescription)")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("nbxvcjhvcvcivscivci",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let data1 = responsData as? [String: Any]{
                                
                                print(")(*&^%^&*(*&^%^&",data1)

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
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/verify") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"

        request.setValue(sendmobile_email, forHTTPHeaderField: "source")
        request.setValue(String(sendOtp), forHTTPHeaderField: "sentOtp")

        print(")(*&^%$%^&*(*&^%$#$%^&*(&^",sendOtp)
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(error?.localizedDescription)")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("nbxvcjhvcvcivscivci",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [String: Any]{
                                
                                completion(true,nil)
                                print(")(*&^%^&*(*&^%^&",data1)

                            }
                            
                        }
                    }else if responsIs.statusCode == 400{
                        
                        completion(false,error)
                        
                    }else{
                        completion(false,error)
                        print("Responce Error is: ", error?.localizedDescription)
                    }

                }
 
            })
            
            task.resume()
        
    }
    
    
    func createNewPassword(sendmobile_email: String, newPasswordToApi: String, completion: @escaping((Bool, Error?) -> ())) {
        
        
//        var header: [String:String] = ["source": sendmobile_email, "newPassword": newPasswordToApi]
        
        print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",sendmobile_email,newPasswordToApi)
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/reset-password") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"

        request.setValue(sendmobile_email, forHTTPHeaderField: "source")
        request.setValue(newPasswordToApi, forHTTPHeaderField: "newPassword")
 
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(error?.localizedDescription)")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("###################",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [String: Any]{
                                
                                completion(true,nil)
                                print(")(*&^%^&*(*&^%^&",data1)

                            }
                            
                        }
                    }else if responsIs.statusCode == 400{
                        
                        completion(false,nil)
                        
//                        do{
//                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
//
//                            if let data1 = responsData as? [String: Any]{
//
//                                completion(data1,nil)
//                                print(")(*&^%^&*(*&^%^&",data1)
//
//                            }
//
//                        }
                    }else{
                        completion(false,error)
                        print("Responce Error is: ", error?.localizedDescription)
                    }

                }
 
            })
            
            task.resume()
        
    }
    
    
}
