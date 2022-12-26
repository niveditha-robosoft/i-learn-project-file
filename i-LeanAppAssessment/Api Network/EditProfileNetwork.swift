//
//  EditProfileNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation
import UIKit

class EditProfileModel {
    
    func profileDataToUpdate(imageToUpdate: UIImage, nameToSend: String,token: String, completion: @escaping((Bool,Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/profile") else{
            return
        }
        
            var request = URLRequest(url: url)

            request.httpMethod = "PATCH"

            let boundary = "Boundary-\(UUID().uuidString)"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            let data = NSMutableData()

        let fieldName = "file"
            if let imageData = imageToUpdate.jpegData(compressionQuality: 1) {
                data.append("--\(boundary)\r\n".data(using: .utf8) ?? data as Data)
                data.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"image.jpg\"\r\n".data(using: .utf8) ?? data as Data)
                data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8) ?? data as Data)
                data.append(imageData)
                data.append("\r\n".data(using: .utf8) ?? data as Data)
            }

        let name = "name"
            data.append("--\(boundary)\r\n".data(using: .utf8) ?? data as Data)
            data.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n".data(using: .utf8) ?? data as Data)
            data.append(nameToSend.data(using: .utf8) ?? data as Data)
            data.append("\r\n".data(using: .utf8) ?? data as Data)

            data.append("--\(boundary)--\r\n".data(using: .utf8) ?? data as Data)

            request.httpBody = data as Data

        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
            
            guard let data = data, error == nil else{
                print("Profile Api Error is: \(String(describing: error?.localizedDescription))")
                return
            }
          
            if let responsIs = responce as? HTTPURLResponse{

                print("Profile api responce",responsIs.statusCode)
                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                    do{
                        let _ = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                        completion(true,nil)
                        
                    }
                }else if (responsIs.statusCode == 400) {
                    
                    completion(false,error)
                }

            }

        })
        
        task.resume()



    }

    
    
   
}

        
    

