//
//  SendUserDataNetworkmanager.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 27/12/22.
//

import Foundation

class SendUserDataNetworkmanager {
    
    func sendUserDataToApi(token: String,userId: Int, subjectId: Int, chapterId: Int, lessonId: Int, unitId: Int, completion: @escaping((Bool,Error?) -> ())) {
        
        print("token : \(token)\nuserId :\(userId)\nsubjectID\(subjectId) :\nchapterId : \(chapterId)\nlessonId : \(lessonId)\nunitId : \(unitId)")
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/add/currently-Studying") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameter: [String:Any] = [

            "userId":userId,

            "subjectId":subjectId,

            "chapterId":chapterId,

            "lessonId":lessonId,

            "unitId":unitId
            

        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: .fragmentsAllowed)
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Sign up Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("user data responce : ",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            completion(true,nil)
                            
                            
                        }
                    }else if responsIs.statusCode == 400{
                        
                        completion(false,nil)
                        
                    }else{
                        completion(false,nil)
                        print("Sign up Responce Error is: ", error?.localizedDescription ?? "Error...?")
                    }

                }
 
            })
            
            task.resume()
    }
}
