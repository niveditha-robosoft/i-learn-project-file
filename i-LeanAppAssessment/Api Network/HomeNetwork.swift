//
//  HomeNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation

class HomeNetwork {
    
    func callCurrentyStudyingApi(token: String, completion: @escaping(([[String: Any]]?,Bool,Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/currentlyStudying") else{
            return
        }
        
        var request = URLRequest(url: url)
                
        request.httpMethod = "GET"

        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(error?.localizedDescription)")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Currenty studying ststus responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let dataIs = responsData as? [[String: Any]]{
                                
                                print("Currenty studying data  : ",dataIs)

                                completion(dataIs,true,nil)
                                
                            }

                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        completion(nil,false,nil)
                    }

                }
 
            })
            
            task.resume()
        
        
    }
    
    
    
}
