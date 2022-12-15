//
//  LessonDetailViewNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import Foundation
class LessonDetailNetwork{
    func apiCallForLessonDetails(unitId:Int){
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(unitId)&page=1") else{return}
        
        var request = URLRequest(url: url)

        var tokenIs = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoYXJzaGFtdW5kYXJhZ2lAZ21haWwuY29tIiwiZXhwIjoxNjcxMTQxNDc4LCJpYXQiOjE2NzExMDU0Nzh9.7KC7kNRIoS0cK_hnPalmCgzKLYMyy-wi1bKGM3j7NBWF0iha4DX_rYVPBHSLhTKkCHh8siU3Mm6R4bPwb37sHg"
        
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

                            print("data is is : \(responsData)")

                        }

                    }else if (responsIs.statusCode == 400 || responsIs.statusCode == 500){

                        print("Responce Error is 400 || 500 : ", error?.localizedDescription)

                            }

                        }

                    })

                    task.resume()

    }
}
