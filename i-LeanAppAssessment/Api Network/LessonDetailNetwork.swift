//
//  LessonDetailViewNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import Foundation
class LessonDetailNetwork{
    func apiCallForLessonDetails(urlIs: String ,token: String, completion: @escaping(([String:Any]?,Bool, Error?) -> ())){
        guard let url = URL(string: urlIs) else{return}
        
        var request = URLRequest(url: url)


        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in

        guard let data = data, error == nil else{

                print("Error is print this: \(error?.localizedDescription)")

                    return

            }

        if let responsIs = responce as? HTTPURLResponse{

                print("subbjectId responce is: ",responsIs.statusCode)

                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                    do{

                        let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                        if let datais = responsData as? [String: Any]{
                            
                            print("fsdfsfsdgsgsfg",datais)
                            completion(datais,true,nil)
                        }

            }

                }else if responsIs.statusCode == 400 {

                    completion(nil, false, error)
                    print("Responce Error is: ", error?.localizedDescription)

                        }

                    }

                })

                task.resume()

    }
    
    
    func likedUnitData(token: String, unitId: Int, completion: @escaping((Bool,Error?) -> ())) {
        
        guard let url = URL(string: "https://app-e-learning-221207163844.azurewebsites.net/user/likedUnit?unitId=\(String(unitId))") else{return}
        
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
            
            guard let data = data, error == nil else{
                
                print("Error is print this: \(error?.localizedDescription)")
                
                return
                
            }
            
            if let responsIs = responce as? HTTPURLResponse{
                
                print("Like unit responce is: ",responsIs.statusCode)
                
                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){
                    
                    do{
                        
                        let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        
                        if let datais = responsData as? [String: Any]{
                            
                            completion(true,nil)
                        }
                        
                    }
                    
                }else{
                    completion(false,nil)
                    print("Responce Error is: ", error?.localizedDescription)
                    
                }
                
            }
            
        })
        
        task.resume()
        
    }
}
