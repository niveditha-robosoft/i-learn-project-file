//
//  SubjectNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 10/12/22.
//

import Foundation
class SubjectListNetwork {
    
    
    func apiCallforSubjectDetails(completion: @escaping(([[String: Any]]?,Error?) -> ())){
        
        print("Api call")
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/view/allSubjects") else{
            return
        }
        
        let request = URLRequest(url: url)
 
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
                
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("nbxvcjhvcvcivscivci",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            
                            if let data1 = responsData as? [[String: Any]] {
                                
                                completion(data1,nil)
                            }
                            
                        }
                    }else{
                        completion(nil,error)
                        print("Responce Error is: ", error?.localizedDescription ?? "Error...!")
                    }

                }
 
            })
            
            task.resume()
        
        
    }
}
