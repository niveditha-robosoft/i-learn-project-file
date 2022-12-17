//
//  LessonDetailViewNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import Foundation
class LessonDetailNetwork{
    func apiCallForLessonDetails(urlIs: String ,completion: @escaping(([String:Any], Error?) -> ())){
        guard let url = URL(string: urlIs) else{return}
        
        var request = URLRequest(url: url)

        var tokenIs = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuYW1yYXRoYXVpMThAZ21haWwuY29tIiwiZXhwIjoxNjcxMjg5NDY0LCJpYXQiOjE2NzEyNTM0NjR9.REwQQBlnJoPVZ9X0YWQLtBDEFvnADftrMRQ8-BGnrIWHrqhpiOLq6mVo5zoyjzHzvnbAJX7FynMacC4lGsP55Q"
        request.httpMethod = "GET"
        request.setValue("Bearer \(tokenIs)", forHTTPHeaderField: "Authorization")
        
        
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
                            completion(datais,nil)
                        }

            }catch{
                        
                       completion(["": ""], error)
                        print(error)
                        
                    }

                }else{

                    completion(["": ""], error)
                    print("Responce Error is: ", error?.localizedDescription)

                        }

                    }

                })

                task.resume()

    }
}
