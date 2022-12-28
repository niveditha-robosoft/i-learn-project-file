//
//  LikedUnitDetailNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 28/12/22.
//

import Foundation

class LikedUnitDetailNetworkManager {
    
    func getLikedUnitDetails(token: String, chapterId: Int, completion: @escaping(([[String: Any]]?,Bool,Error?) -> ())) {
        
        
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/view/unitByLesson?lessonId=\(String(chapterId))") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Liked chapter data responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let data1 = responsData as? [[String: Any]]{
                                
                                print("Send otp data : ",data1)

                                completion(data1,true,nil)
                                
                            }
                            
                            
                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        completion(nil,false,error)

                    }

                }
 
            })
            
            task.resume()
        
    }
    
}
