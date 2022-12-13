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
                    print("Error is: \(error?.localizedDescription)")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("nbxvcjhvcvcivscivci",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [String: Any]{
                                
                                print("SIGN UP STATUS 200: ",data1)

                                completion(true ,nil)
                            }
                            
                        } 
                    }else if responsIs.statusCode == 400{
                        completion(false,error)
                    }else{
                        print("Responce Error is: ", error?.localizedDescription)
                    }

                }
 
            })
            
            task.resume()

    }
    
    
    
    
    func postTheSignInDataToApi(mobilenumber_EmailToSend: String, passwordToSend: String, completion: @escaping(([String: Any],Error?) -> ())) {

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
                    print("Error is: \(error?.localizedDescription)")
                    return
                }


                if let responsIs = responce as? HTTPURLResponse{

                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let data = responsData as? [String: Any] {
                                
                                print(data)
                                completion(data,nil)
                                
                            }
                        }
                    }else if responsIs.statusCode == 400{
                        completion(["error message": "Invalid user name or password"],error)
                        
                    }else{
                        
                        print("Http Responce Error is: ", error?.localizedDescription)
                        
                    }

                }

            })

            task.resume()

    }
}
