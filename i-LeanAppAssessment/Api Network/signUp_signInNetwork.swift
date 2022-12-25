//
//  signUpNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import Foundation
class SignUpAndSignInApiNetwork {
    
    
    func postTheSignUpDataToApi(nameToSend: String, mobilenumber_EmailToSend: String, passwordToSend: String, completion: @escaping((Bool,Error?) -> ())) {
        
        print(nameToSend,mobilenumber_EmailToSend,passwordToSend)
        
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/register") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameter: [String:Any] = [

            "fullName": nameToSend,
            "source": mobilenumber_EmailToSend,
            "password": passwordToSend

        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: .fragmentsAllowed)
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Sign up Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Sign up responce : ",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [String: Any]{
                                
                                print("SIGN UP data: ",data1)

                                completion(true ,nil)
                            }
                            
                        } 
                    }else if responsIs.statusCode == 400{
                        completion(false,error)
                    }else{
                        print("Sign up Responce Error is: ", error?.localizedDescription ?? "Error...?")
                    }

                }
 
            })
            
            task.resume()

    }
    
    
    
    
    func postTheSignInDataToApi(mobilenumber_EmailToSend: String, passwordToSend: String, completion: @escaping(([String: Any]?,Bool,Error?) -> ())) {

        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/auth/login") else{
            return
        }

        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameter: [String:Any] = [

            "source": mobilenumber_EmailToSend,
            "password": passwordToSend

        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: .fragmentsAllowed)

            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in

                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    completion(nil,false,error)
                    return
                }


                if let responsIs = responce as? HTTPURLResponse{
                    print("Sign in responce : ",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let data = responsData as? [String: Any] {
                                
                                print("Sign in data ",data)
                                completion(data,true,nil)
                                
                            }
                        }
                    }else if responsIs.statusCode == 400{
                        
                        completion(nil,false,nil)

                        
                    }else{
                        
                        print(" Sign in Http Responce Error is: ", error?.localizedDescription ?? "Error..?")
                        
                    }

                }

            })

            task.resume()

    }
}
