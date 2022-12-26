//
//  SubjectDetailsNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import Foundation


class AboutSubjectNetwork {
    
    func callApiForDetailsOfTheSubject(subbjectId: Int, completion: @escaping(([[String:Any]]?, Bool, Error?) -> ())) {
    
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/view/chapters?subject_id=\(subbjectId)") else{return}
        
        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in

        guard let data = data, error == nil else{

            print("Error is print this: \(String(describing: error?.localizedDescription))")

                    return

            }

        if let responsIs = responce as? HTTPURLResponse{

                print("subbjectId responce is: ",responsIs.statusCode)

                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{

                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let datais = responsData as? [[String: Any]]{
                                
                                completion(datais, true ,nil)
                            }

                        }

                    }else if (responsIs.statusCode == 400){

                        completion(nil, false , error)
                        print("Responce Error is: ", error?.localizedDescription ?? "Error...!")

                            }

                        }

                    })

                    task.resume()

    }
       
    
    
    func callApiForDetailsOfTheLesson(tokenIs: String,lessonId: Int, completion: @escaping(([[String: Any]],Error?) -> ())) {
        
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/view/LessonsAndUnit?chapterId=\(lessonId)") else{return}
        
        
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        
        request.setValue("Bearer \(tokenIs)", forHTTPHeaderField: "Authorization")

        
        //request.setValue("Bearer \(tokenIs)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in

        guard let data = data, error == nil else{

            print("Error is print this: \(String(describing: error?.localizedDescription))")

                    return

            }

        if let responsIs = responce as? HTTPURLResponse{

                print("lessonId responce is: ",responsIs.statusCode)

                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{

                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let datais = responsData as? [[String: Any]]{
                                
                                print("lessonData")
                                completion(datais,nil)
                            }

                        }

                    }else{

                        completion([["": ""]], error)
                        print("Responce Error is: ", error?.localizedDescription ?? "Error...!")

                            }

                        }

                    })

                    task.resume()
        
    }
}
